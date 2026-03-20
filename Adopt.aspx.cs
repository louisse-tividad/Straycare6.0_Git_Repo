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
    public partial class Adopt : System.Web.UI.Page
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

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            string animalType = ddlAnimalType.SelectedValue;

            if (string.IsNullOrEmpty(animalType))
            {
                lblMessage.Text = "Please select Dog or Cat.";
                rptPets.DataSource = null;
                rptPets.DataBind();
                pnlEmpty.Visible = false;
                return;
            }

            LoadPets(animalType);
        }

        private void LoadPets(string animalType)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"SELECT PetId, PhotoPath, AnimalType, Gender
                                 FROM AdoptionPets
                                 WHERE AnimalType = @AnimalType AND IsAvailable = 1
                                 ORDER BY CreatedAt DESC";

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@AnimalType", animalType);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    rptPets.DataSource = dt;
                    rptPets.DataBind();
                    pnlEmpty.Visible = false;
                    lblMessage.Text = "";
                }
                else
                {
                    rptPets.DataSource = null;
                    rptPets.DataBind();
                    pnlEmpty.Visible = true;
                }
            }
        }
    }
}