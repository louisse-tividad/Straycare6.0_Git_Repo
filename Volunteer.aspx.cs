using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace StrayCare6._0
{
    public partial class Volunteer : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["StrayCareConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                UpdateEventStatuses();
                LoadEvents();
            }
        }

        private void UpdateEventStatuses()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"
                    UPDATE VolunteerEvents
                    SET Status = CASE
                        WHEN CurrentParticipants >= MaxParticipants THEN 'Closed'
                        ELSE 'Open'
                    END";

                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void LoadEvents()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT EventId, EventTitle, Location, EventTime, EventEndTime,
                                        Description, PhotoPath, CurrentParticipants, MaxParticipants, Status
                                 FROM VolunteerEvents
                                 ORDER BY EventTime ASC";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptEvents.DataSource = dt;
                rptEvents.DataBind();
            }
        }
    }
}

