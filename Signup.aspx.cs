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
    public partial class Signup : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["StrayCareConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string birthday = txtBirthday.Text.Trim();
            string email = txtEmail.Text.Trim();
            string phoneNumber = txtPhoneNumber.Text.Trim();

            if (string.IsNullOrEmpty(username) ||
                string.IsNullOrEmpty(password) ||
                string.IsNullOrEmpty(birthday) ||
                string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(phoneNumber))
            {
                lblMessage.CssClass = "message-label";
                lblMessage.Text = "Please fill in all fields.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                string checkQuery = "SELECT COUNT(*) FROM Users WHERE Username = @Username OR Email = @Email";
                SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                checkCmd.Parameters.AddWithValue("@Username", username);
                checkCmd.Parameters.AddWithValue("@Email", email);

                int exists = (int)checkCmd.ExecuteScalar();

                if (exists > 0)
                {
                    lblMessage.CssClass = "message-label";
                    lblMessage.Text = "Username or Email already exists.";
                    return;
                }

                string insertQuery = @"INSERT INTO Users (Username, [Password], Birthday, Email, PhoneNumber)
                                       VALUES (@Username, @Password, @Birthday, @Email, @PhoneNumber)";

                SqlCommand cmd = new SqlCommand(insertQuery, conn);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Birthday", Convert.ToDateTime(birthday));
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);

                int result = cmd.ExecuteNonQuery();

                if (result > 0)
                {
                    lblMessage.CssClass = "message-label success-label";
                    lblMessage.Text = "Account created successfully!";

                    txtUsername.Text = "";
                    txtPassword.Text = "";
                    txtBirthday.Text = "";
                    txtEmail.Text = "";
                    txtPhoneNumber.Text = "";
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