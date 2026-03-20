using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace StrayCare6._0
{
    public partial class AdoptionApply : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["StrayCareConn"].ConnectionString;
        int petId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!int.TryParse(Request.QueryString["petId"], out petId))
            {
                Response.Redirect("Adopt.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadPetInfo();
            }
        }

        private void LoadPetInfo()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT AnimalType, Gender
                                 FROM AdoptionPets
                                 WHERE PetId = @PetId AND IsAvailable = 1";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@PetId", petId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    lblPetInfo.Text = reader["AnimalType"].ToString() + " - " + reader["Gender"].ToString();
                }
                else
                {
                    Response.Redirect("Adopt.aspx");
                }

                reader.Close();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string fullAddress = txtFullAddress.Text.Trim();
            string housingInfo = txtHousingInfo.Text.Trim();
            string houseType = ddlHouseType.SelectedValue;
            string ownOrRent = ddlOwnOrRent.SelectedValue;
            string employmentStatus = ddlEmploymentStatus.SelectedValue;
            string otherDetails = txtOtherDetails.Text.Trim();

            if (string.IsNullOrEmpty(fullName) ||
                string.IsNullOrEmpty(fullAddress) ||
                string.IsNullOrEmpty(housingInfo) ||
                string.IsNullOrEmpty(houseType) ||
                string.IsNullOrEmpty(ownOrRent) ||
                string.IsNullOrEmpty(employmentStatus) ||
                string.IsNullOrEmpty(otherDetails))
            {
                lblMessage.Text = "Please fill in all required fields.";
                return;
            }

            string username = Session["Username"].ToString();
            int userId = GetUserId(username);
            int applicationId = 0;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"INSERT INTO AdoptionApplications
                                (PetId, UserId, FullName, FullAddress, HousingInformation, HouseType,
                                 OwnOrRent, EmploymentStatus, OtherDetails, ApplicationStatus, AdminRemarks, CreatedAt)
                                VALUES
                                (@PetId, @UserId, @FullName, @FullAddress, @HousingInformation, @HouseType,
                                 @OwnOrRent, @EmploymentStatus, @OtherDetails, @ApplicationStatus, @AdminRemarks, GETDATE());
                                SELECT SCOPE_IDENTITY();";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@PetId", petId);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@FullName", fullName);
                cmd.Parameters.AddWithValue("@FullAddress", fullAddress);
                cmd.Parameters.AddWithValue("@HousingInformation", housingInfo);
                cmd.Parameters.AddWithValue("@HouseType", houseType);
                cmd.Parameters.AddWithValue("@OwnOrRent", ownOrRent);
                cmd.Parameters.AddWithValue("@EmploymentStatus", employmentStatus);
                cmd.Parameters.AddWithValue("@OtherDetails", otherDetails);
                cmd.Parameters.AddWithValue("@ApplicationStatus", "Under Review");
                cmd.Parameters.AddWithValue("@AdminRemarks", DBNull.Value);

                conn.Open();
                object result = cmd.ExecuteScalar();
                applicationId = Convert.ToInt32(result);
            }

            CreateNotification(userId, applicationId,
                "Adoption Application Submitted",
                "Your application for adoption is under review, we will notify you once approved.");

            Response.Redirect("Dashboard.aspx");
        }

        private int GetUserId(string username)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT UserId FROM Users WHERE Username = @Username";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);

                conn.Open();
                object result = cmd.ExecuteScalar();

                if (result != null)
                {
                    return Convert.ToInt32(result);
                }
            }

            return 0;
        }

        private void CreateNotification(int userId, int applicationId, string title, string message)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"INSERT INTO UserNotifications
                                (UserId, ApplicationId, Title, Message, IsRead, CreatedAt)
                                VALUES
                                (@UserId, @ApplicationId, @Title, @Message, 0, GETDATE())";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@ApplicationId", applicationId);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Message", message);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}