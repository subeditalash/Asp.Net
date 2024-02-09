using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CW2_AD
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //checks the user login status and if not redirects to login page 

            if (Session["UserName"] == null)
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Please login first!');window.location='Login.aspx';</script>");
            }
        }

        // -----changing data as per the user selected data-----------//

        protected void Search_mem_loan_Click(object sender, EventArgs e)
        {
            copy_loan.DataSourceID = "";
            copy_loan.DataSource = SqlDataSource6;
            copy_loan.DataBind();
        }

        protected void Loan_day_btn_Click(object sender, EventArgs e)
        {
            loans_in_a_day.DataSourceID = "";
            loans_in_a_day.DataSource = SqlDataSource7;
            loans_in_a_day.DataBind();
        }

        protected void Too_old_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource12.Delete();
        }
    }
}