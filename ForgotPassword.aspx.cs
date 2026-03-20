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
    public partial class ForgotPassword : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["StrayCareConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();

            if (string.IsNullOrEmpty(email))
            {
                lblMessage.CssClass = "message-label";
                lblMessage.Text = "Please enter your email.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string getUserQuery = "SELECT UserId FROM Users WHERE Email = @Email";
                SqlCommand getUserCmd = new SqlCommand(getUserQuery, conn);
                getUserCmd.Parameters.AddWithValue("@Email", email);

                object result = getUserCmd.ExecuteScalar();

                if (result == null)
                {
                    lblMessage.CssClass = "message-label";
                    lblMessage.Text = "Email not found.";
                    return;
                }

                int userId = Convert.ToInt32(result);
                Guid resetToken = Guid.NewGuid();
                DateTime expiryDate = DateTime.Now.AddHours(1);

                string insertTokenQuery = @"INSERT INTO PasswordResetTokens
                                            (UserId, ResetToken, ExpiryDate, IsUsed)
                                            VALUES
                                            (@UserId, @ResetToken, @ExpiryDate, @IsUsed)";

                SqlCommand insertCmd = new SqlCommand(insertTokenQuery, conn);
                insertCmd.Parameters.AddWithValue("@UserId", userId);
                insertCmd.Parameters.AddWithValue("@ResetToken", resetToken);
                insertCmd.Parameters.AddWithValue("@ExpiryDate", expiryDate);
                insertCmd.Parameters.AddWithValue("@IsUsed", 0);

                int rows = insertCmd.ExecuteNonQuery();

                if (rows > 0)
                {
                    lblMessage.CssClass = "message-label success-label";
                    lblMessage.Text = "Password reset request saved successfully.";
                }
                else
                {
                    lblMessage.CssClass = "message-label";
                    lblMessage.Text = "Something went wrong.";
                }
            }
        }
    }
}