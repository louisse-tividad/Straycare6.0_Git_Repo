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
    public partial class VolunteerApply : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["StrayCareConn"].ConnectionString;
        int eventId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!int.TryParse(Request.QueryString["eventId"], out eventId))
            {
                Response.Redirect("Volunteer.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadEventTitle();
            }
        }

        private void LoadEventTitle()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT EventTitle, Status, CurrentParticipants, MaxParticipants
                                 FROM VolunteerEvents
                                 WHERE EventId = @EventId";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@EventId", eventId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    if (reader["EventTitle"] != DBNull.Value)
                    {
                        lblEventTitle.Text = "<b>Event:</b> " + Server.HtmlEncode(reader["EventTitle"].ToString());
                    }
                    else
                    {
                        lblEventTitle.Text = "<b>Event:</b> Not Available";
                    }

                    string status = reader["Status"] != DBNull.Value ? reader["Status"].ToString() : "";
                    int currentParticipants = reader["CurrentParticipants"] != DBNull.Value ? Convert.ToInt32(reader["CurrentParticipants"]) : 0;
                    int maxParticipants = reader["MaxParticipants"] != DBNull.Value ? Convert.ToInt32(reader["MaxParticipants"]) : 0;

                    if (status == "Closed" || currentParticipants >= maxParticipants)
                    {
                        lblMessage.Text = "This event is already closed or full.";
                        btnSubmit.Enabled = false;
                    }
                }
                else
                {
                    lblMessage.Text = "Event not found.";
                    btnSubmit.Enabled = false;
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtFullName.Text) || string.IsNullOrWhiteSpace(txtFullAddress.Text))
            {
                lblMessage.Text = "Please fill in all fields.";
                return;
            }

            int userId = GetUserId(Session["Username"].ToString());

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlTransaction trans = conn.BeginTransaction();

                try
                {
                    string checkDuplicateQuery = @"SELECT COUNT(*)
                                                   FROM VolunteerApplications
                                                   WHERE EventId = @EventId AND UserId = @UserId";

                    SqlCommand checkCmd = new SqlCommand(checkDuplicateQuery, conn, trans);
                    checkCmd.Parameters.AddWithValue("@EventId", eventId);
                    checkCmd.Parameters.AddWithValue("@UserId", userId);

                    int alreadyApplied = Convert.ToInt32(checkCmd.ExecuteScalar());
                    if (alreadyApplied > 0)
                    {
                        lblMessage.Text = "You have already applied for this event.";
                        trans.Rollback();
                        return;
                    }

                    string checkEventQuery = @"SELECT CurrentParticipants, MaxParticipants, Status
                                               FROM VolunteerEvents
                                               WHERE EventId = @EventId";

                    SqlCommand eventCmd = new SqlCommand(checkEventQuery, conn, trans);
                    eventCmd.Parameters.AddWithValue("@EventId", eventId);

                    using (SqlDataReader reader = eventCmd.ExecuteReader())
                    {
                        if (!reader.Read())
                        {
                            lblMessage.Text = "Event not found.";
                            reader.Close();
                            trans.Rollback();
                            return;
                        }

                        int currentParticipants = Convert.ToInt32(reader["CurrentParticipants"]);
                        int maxParticipants = Convert.ToInt32(reader["MaxParticipants"]);
                        string status = reader["Status"].ToString();

                        if (status == "Closed" || currentParticipants >= maxParticipants)
                        {
                            lblMessage.Text = "This event is already full or closed.";
                            reader.Close();
                            trans.Rollback();
                            return;
                        }
                    }

                    string insertQuery = @"INSERT INTO VolunteerApplications
                                           (EventId, UserId, FullName, FullAddress)
                                           VALUES
                                           (@EventId, @UserId, @FullName, @FullAddress)";

                    SqlCommand cmd1 = new SqlCommand(insertQuery, conn, trans);
                    cmd1.Parameters.AddWithValue("@EventId", eventId);
                    cmd1.Parameters.AddWithValue("@UserId", userId);
                    cmd1.Parameters.AddWithValue("@FullName", txtFullName.Text.Trim());
                    cmd1.Parameters.AddWithValue("@FullAddress", txtFullAddress.Text.Trim());
                    cmd1.ExecuteNonQuery();

                    string updateCountQuery = @"UPDATE VolunteerEvents
                                                SET CurrentParticipants = CurrentParticipants + 1
                                                WHERE EventId = @EventId";

                    SqlCommand cmd2 = new SqlCommand(updateCountQuery, conn, trans);
                    cmd2.Parameters.AddWithValue("@EventId", eventId);
                    cmd2.ExecuteNonQuery();

                    string updateStatusQuery = @"UPDATE VolunteerEvents
                                                 SET Status = CASE
                                                     WHEN CurrentParticipants >= MaxParticipants THEN 'Closed'
                                                     ELSE 'Open'
                                                 END
                                                 WHERE EventId = @EventId";

                    SqlCommand cmd3 = new SqlCommand(updateStatusQuery, conn, trans);
                    cmd3.Parameters.AddWithValue("@EventId", eventId);
                    cmd3.ExecuteNonQuery();

                    trans.Commit();
                    Response.Redirect("Dashboard.aspx");
                }
                catch (Exception)
                {
                    trans.Rollback();
                    lblMessage.Text = "Something went wrong.";
                }
            }
        }

        private int GetUserId(string username)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("SELECT UserId FROM Users WHERE Username = @Username", conn);
                cmd.Parameters.AddWithValue("@Username", username);

                conn.Open();
                object result = cmd.ExecuteScalar();

                if (result == null)
                {
                    throw new Exception("User not found.");
                }

                return Convert.ToInt32(result);
            }
        }
    }
}