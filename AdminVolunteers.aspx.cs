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
    public partial class AdminVolunteers : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["StrayCareConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null || Session["IsAdmin"] == null || !Convert.ToBoolean(Session["IsAdmin"]))
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadVolunteerEvents();
            }
        }

        private void LoadVolunteerEvents()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT EventTitle, Location, EventTime, EventEndTime,
                                        CurrentParticipants, MaxParticipants, Status
                                 FROM VolunteerEvents
                                 ORDER BY EventTime DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvVolunteers.DataSource = dt;
                gvVolunteers.DataBind();
            }
        }
    }
}