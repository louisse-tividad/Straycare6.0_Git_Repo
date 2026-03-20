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
    public partial class AdminReports : System.Web.UI.Page
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
                LoadReports();
            }
        }

        private void LoadReports()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT r.ReportId, u.Username, r.AnimalType, r.Gender, r.Location,
                                        r.AnimalCondition, r.KeepStatus, r.ReportStatus, r.CreatedAt
                                 FROM StrayReports r
                                 INNER JOIN Users u ON r.UserId = u.UserId
                                 ORDER BY r.CreatedAt DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvReports.DataSource = dt;
                gvReports.DataBind();
            }
        }
    }
}