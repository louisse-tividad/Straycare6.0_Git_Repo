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
    public partial class Login : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["StrayCareConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
            {
                lblMessage.Text = "Please enter email and password.";
                return;
            }

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT Username, IsAdmin
                                 FROM Users
                                 WHERE Email = @Email AND [Password] = @Password";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    Session["Username"] = reader["Username"].ToString();
                    Session["IsAdmin"] = Convert.ToBoolean(reader["IsAdmin"]);

                    if (Convert.ToBoolean(reader["IsAdmin"]))
                    {
                        Response.Redirect("AdminDashboard.aspx");
                    }
                    else
                    {
                        Response.Redirect("Dashboard.aspx");
                    }
                }
                else
                {
                    lblMessage.Text = "Username or password is incorrect";
                }

                reader.Close();
            }
        }
    }
}