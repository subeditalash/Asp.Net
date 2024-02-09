using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CW2_AD
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_signup_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registration/Sign_up.aspx");   //redirecting to the sign up page
        }

        protected void btn_login_Click(object sender, EventArgs e)
        {

            DataTable dt = ((DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty)).Table;
            if (dt.Rows.Count != 0)
            {
                if (dt.Rows[0][5].ToString() == "Admin")
                {
                    //checking if the user is admin and storing user details in sessions

                    Session["UserNumber"] = dt.Rows[0][0].ToString();
                    Session["UserName"] = dt.Rows[0][1].ToString();
                    Session["UserPassword"] = dt.Rows[0][2].ToString();
                    Session["Email"] = dt.Rows[0][3].ToString();
                    Session["DOB"] = dt.Rows[0][4].ToString();
                    Session["UserType"] = dt.Rows[0][5].ToString();
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Successfully logged in as " + Session["UserType"] + "');window.location='User_profile.aspx';</script>");


                }
                else if (dt.Rows[0][5].ToString() == "Staff")
                {
                    //checking if the user is staff and storing user details in sessions

                    Session["UserNumber"] = dt.Rows[0][0].ToString();
                    Session["UserName"] = dt.Rows[0][1].ToString();
                    Session["UserPassword"] = dt.Rows[0][2].ToString();
                    Session["Email"] = dt.Rows[0][3].ToString();
                    Session["DOB"] = dt.Rows[0][4].ToString();
                    Session["UserType"] = dt.Rows[0][5].ToString();
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Successfully logged in as" + Session["UserType"] + "');window.location='User_profile.aspx';</script>");
                }
            }
            Response.Write("<script>" + Session["UserType"] + "</script>");

        }

    }
}