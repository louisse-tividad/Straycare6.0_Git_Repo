using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;


namespace StrayCare6._0
{
    public partial class Donations : System.Web.UI.Page
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

        protected void btnDone_Click(object sender, EventArgs e)
        {
            string donationType = hfDonationType.Value;
            string username = Session["Username"].ToString();
            int userId = GetUserId(username);

            if (string.IsNullOrEmpty(donationType))
            {
                lblMessage.Text = "Please choose Cash Donation or In-Kind Donation.";
                return;
            }

            if (donationType == "Cash")
            {
                SaveCashDonation(userId);
            }
            else if (donationType == "In-Kind")
            {
                SaveInKindDonation(userId);
            }
        }

        private void SaveCashDonation(int userId)
        {
            string donorName = txtDonorName.Text.Trim();
            string amountText = txtAmount.Text.Trim();
            string referenceNumber = txtReferenceNumber.Text.Trim();

            decimal amount;
            if (string.IsNullOrEmpty(donorName) ||
                string.IsNullOrEmpty(amountText) ||
                string.IsNullOrEmpty(referenceNumber))
            {
                lblMessage.Text = "Please fill in all required cash donation fields.";
                hfDonationType.Value = "Cash";
                return;
            }

            if (!decimal.TryParse(amountText, out amount))
            {
                lblMessage.Text = "Please enter a valid amount.";
                hfDonationType.Value = "Cash";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"INSERT INTO Donations
                                (UserId, DonationType, ShelterName, GCashNumber, DonorName, Amount, ReferenceNumber, Status, CreatedAt)
                                VALUES
                                (@UserId, @DonationType, @ShelterName, @GCashNumber, @DonorName, @Amount, @ReferenceNumber, @Status, GETDATE())";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@DonationType", "Cash");
                cmd.Parameters.AddWithValue("@ShelterName", "Second Change Aspin Shelter Philippines Inc. (SECASPI)");
                cmd.Parameters.AddWithValue("@GCashNumber", "09953636950");
                cmd.Parameters.AddWithValue("@DonorName", donorName);
                cmd.Parameters.AddWithValue("@Amount", amount);
                cmd.Parameters.AddWithValue("@ReferenceNumber", referenceNumber);
                cmd.Parameters.AddWithValue("@Status", "Pending Verification");

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Session["DonationSuccessMessage"] = "Thank you for donating. We will notify you on your email once we verify your donation.";
            Response.Redirect("Dashboard.aspx");
        }

        private void SaveInKindDonation(int userId)
        {
            var selectedItems = cblItems.Items.Cast<ListItem>()
                                .Where(i => i.Selected)
                                .Select(i => i.Value)
                                .ToList();

            string deliveryMethod = ddlDeliveryMethod.SelectedValue;

            if (selectedItems.Count == 0 || string.IsNullOrEmpty(deliveryMethod))
            {
                lblMessage.Text = "Please select what you are donating and how you will send it.";
                hfDonationType.Value = "In-Kind";
                return;
            }

            string items = string.Join(", ", selectedItems);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"INSERT INTO Donations
                                (UserId, DonationType, InKindItems, DeliveryMethod, Status, CreatedAt)
                                VALUES
                                (@UserId, @DonationType, @InKindItems, @DeliveryMethod, @Status, GETDATE())";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@DonationType", "In-Kind");
                cmd.Parameters.AddWithValue("@InKindItems", items);
                cmd.Parameters.AddWithValue("@DeliveryMethod", deliveryMethod);
                cmd.Parameters.AddWithValue("@Status", "Pending Contact");

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Session["DonationSuccessMessage"] = "Thank you for donating. We will contact you soon to process your in-kind donation.";
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
    }
}