using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CW2_AD
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Search_by_lname_Click(object sender, EventArgs e)
        {
            //assigning data source to the last name table

            lname_SearchData.DataSourceID = "";
            lname_SearchData.DataSource = SqlDataSource1;
            lname_SearchData.DataBind();
        }

        protected void Lname_copies_Click(object sender, EventArgs e)
        {
            //assigning data source of the gridview

            lname_copies_on_shelves.DataSourceID = "";
            lname_copies_on_shelves.DataSource = SqlDataSource3;
            lname_copies_on_shelves.DataBind();
        }
    }
}