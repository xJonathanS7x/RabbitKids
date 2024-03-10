using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebAppFER
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (true) //checa si ya esta iniciada una sesion
                {
                    DoctorsRedirect.Visible = true;
                }

                string path = HttpContext.Current.Request.Url.AbsolutePath;
                switch (path.ToLower().Split('.')[0])
                {
                    case "/default":
                        HomeRedirect.Attributes["style"] = "text-decoration: underline; text-underline-offset: 0.5rem;";
                        HomeRedirect.HRef = "#";
                        break;
                    case "/doctors":
                        DoctorsRedirect.Attributes["style"] = "text-decoration: underline; text-underline-offset: 0.5rem;";
                        DoctorsRedirect.HRef = "#";
                        break;
                    case "/login":
                        LoginRedirect.Visible = false;
                        break;
                    //case "/getstarted":
                    //    GetStartedRedirect.Visible = false;
                    //    break;
                }
            }
        }
    }
}