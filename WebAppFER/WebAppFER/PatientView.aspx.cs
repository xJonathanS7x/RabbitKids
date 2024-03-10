using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppFER
{
    public partial class PatientView : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["RabbitKids"].ConnectionString;

        private int _PatientID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                getPatientInfo();
                getPatientCoreData();
            }
        }

        private void getPatientCoreData()
        {
            DataSet ds = new DataSet();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("dbo.spSELECT_PatientCoreData", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PatientID", _PatientID);
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                    }
                }
                conn.Close();
            }
        }

        private void getPatientInfo()
        {
            _PatientID = Convert.ToInt32(Session["PatientID"]);

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("dbo.spSELECT_PatientInfo", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@PatientID", _PatientID);
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            lbName.Text = dr["PatientName"].ToString();
                            lbIllness.Text = dr["Illness"].ToString();
                            lbAge.Text = dr["Age"].ToString();
                            lbEmail.Text = dr["Email"].ToString();
                        }
                    }
                }
            }
        }

       

        protected void GoBack(object sender, EventArgs e)
        {
            Response.Redirect("Patients.aspx");
        }
    }
}