using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StrayCare6._0
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string subject = txtSubject.Text.Trim();
            string message = txtMessage.Text.Trim();

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(subject) || string.IsNullOrEmpty(message))
            {
                lblMessage.Style["color"] = "red";
                lblMessage.Text = "Please fill in all fields.";
                return;
            }

            lblMessage.Style["color"] = "green";
            lblMessage.Text = "Your message has been sent successfully.";

            txtName.Text = "";
            txtSubject.Text = "";
            txtMessage.Text = "";
        }
    }
}