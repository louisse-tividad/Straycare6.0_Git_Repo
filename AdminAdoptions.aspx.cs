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
    public partial class AdminAdoptions : System.Web.UI.Page
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
                LoadAdoptions();
            }
        }

        private void LoadAdoptions()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT a.ApplicationId, u.Username, p.AnimalType, p.Gender,
                                        a.FullName, a.HouseType, a.OwnOrRent, a.EmploymentStatus,
                                        a.ApplicationStatus, a.CreatedAt
                                 FROM AdoptionApplications a
                                 INNER JOIN Users u ON a.UserId = u.UserId
                                 INNER JOIN AdoptionPets p ON a.PetId = p.PetId
                                 ORDER BY a.CreatedAt DESC";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvAdoptions.DataSource = dt;
                gvAdoptions.DataBind();
            }
        }
    }
}