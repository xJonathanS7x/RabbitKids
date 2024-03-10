using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppFER
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["RabbitKids"].ConnectionString;

        private int _PatientID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getPatients();
            }            
        }

        private void getPatients()
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("dbo.spSELECT_AllPatients", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
                conn.Close();
            }
            gvPatients.DataSource = dt;
            gvPatients.DataBind();
        }

        protected void btnSelect_Command(object sender, CommandEventArgs e)
        {
            // Get the button that raised the event
            Button btn = (Button)sender;
            // Get the row index from the command argument
            int index = Convert.ToInt32(e.CommandArgument);
            // Get the value of the Name field from the DataKeys collection
            _PatientID = Convert.ToInt32(gvPatients.Rows[index].Cells[0].Text);

            Session["PatientID"] = _PatientID;
            // Do something with the name value, such as displaying it
            Response.Redirect("PatientView.aspx");
            //Label1.Text = "You selected row " + index + " with name " + name;
        }

    }
}