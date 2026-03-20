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
    public partial class AdminDonations : System.Web.UI.Page
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
                LoadDonations();
            }
        }

        private void LoadDonations()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT d.DonationId, u.Username, d.DonationType, d.DonorName, d.Amount,
                                        d.ReferenceNumber, d.InKindItems, d.DeliveryMethod,
                                        d.Status, d.CreatedAt
                                 FROM Donations d
                                 INNER JOIN Users u ON d.UserId = u.UserId
                                 ORDER BY d.CreatedAt DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvDonations.DataSource = dt;
                gvDonations.DataBind();
            }
        }
    }
}