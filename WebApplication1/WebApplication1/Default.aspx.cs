using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRun_Click(object sender, EventArgs e)
        {
            string strSDate;
            string strEDate;
            strSDate = this.ctlSelectionPane1.StartDate.ToString("MM/dd/yyyy");
            strEDate = this.ctlSelectionPane1.EndDate.ToString("MM/dd/yyyy");
            Response.Redirect("Orders.aspx?SDate=" + strSDate + "&?EDate=" + strEDate );
        }
    }
}