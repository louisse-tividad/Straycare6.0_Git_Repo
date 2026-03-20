using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace StrayCare6._0


{
    public partial class ReportStray : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["StrayCareConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string username = Session["Username"].ToString();
            string animalType = ddlAnimalType.SelectedValue;
            string gender = ddlGender.SelectedValue;
            string location = txtLocation.Text.Trim();
            string dateTimeText = txtDateTime.Text.Trim();
            string condition = ddlCondition.SelectedValue;
            string otherDetails = txtOtherDetails.Text.Trim();
            string keptStatus = rblKept.SelectedValue;
            string fullName = txtFullName.Text.Trim();
            string fullAddress = txtFullAddress.Text.Trim();

            if (string.IsNullOrEmpty(animalType) ||
                string.IsNullOrEmpty(gender) ||
                string.IsNullOrEmpty(location) ||
                string.IsNullOrEmpty(dateTimeText) ||
                string.IsNullOrEmpty(condition))
            {
                lblMessage.Text = "Please fill in all required report fields.";
                return;
            }

            if (!location.ToLower().Contains("calamba"))
            {
                lblMessage.Text = "Reports must be within Calamba City, Laguna.";
                return;
            }

            if (!fuPhoto.HasFile)
            {
                lblMessage.Text = "Please upload a clear photo of the stray animal.";
                return;
            }

            DateTime reportedDateTime;
            if (!DateTime.TryParse(dateTimeText, out reportedDateTime))
            {
                lblMessage.Text = "Please enter a valid date and time.";
                return;
            }

            if (keptStatus == "Kept")
            {
                if (string.IsNullOrEmpty(fullName) || string.IsNullOrEmpty(fullAddress))
                {
                    lblMessage.Text = "Please fill in Full Name and Full Address if you kept the stray.";
                    return;
                }
            }

            string fileName = Guid.NewGuid().ToString() + Path.GetExtension(fuPhoto.FileName);
            string folderPath = Server.MapPath("~/Uploads/Reports/");
            string relativePath = "~/Uploads/Reports/" + fileName;

            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            fuPhoto.SaveAs(Path.Combine(folderPath, fileName));

            int userId = GetUserId(username);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"INSERT INTO StrayReports
                                (UserId, AnimalType, Gender, Location, ReportDateTime, AnimalCondition,
                                 OtherDetails, PhotoPath, KeepStatus, FullName, FullAddress, ReportStatus, AdminRemarks, CreatedAt)
                                VALUES
                                (@UserId, @AnimalType, @Gender, @Location, @ReportDateTime, @AnimalCondition,
                                 @OtherDetails, @PhotoPath, @KeepStatus, @FullName, @FullAddress, @ReportStatus, @AdminRemarks, GETDATE())";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@AnimalType", animalType);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@Location", location);
                cmd.Parameters.AddWithValue("@ReportDateTime", reportedDateTime);
                cmd.Parameters.AddWithValue("@AnimalCondition", condition);
                cmd.Parameters.AddWithValue("@OtherDetails", (object)otherDetails ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@PhotoPath", relativePath);
                cmd.Parameters.AddWithValue("@KeepStatus", keptStatus);
                cmd.Parameters.AddWithValue("@FullName", keptStatus == "Kept" ? fullName : (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@FullAddress", keptStatus == "Kept" ? fullAddress : (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@ReportStatus", "Pending");
                cmd.Parameters.AddWithValue("@AdminRemarks", DBNull.Value);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            if (keptStatus == "Kept")
            {
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                Response.Redirect("PendingReports.aspx");
            }
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
    }
}