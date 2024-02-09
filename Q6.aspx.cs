using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CW2_AD
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void member_id_SelectedIndexChanged(object sender, EventArgs e)
        {
            member.DataSource = "";
            member.DataSource = SqlDataSource1;
            member.DataBind();
        }
    }
}