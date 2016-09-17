using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ctlSelectionPane : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnStartDate_Click(object sender, ImageClickEventArgs e)
        {
            this.clndStartDate.Visible = !this.clndStartDate.Visible;
        }

        protected void clndStartDate_SelectionChanged(object sender, EventArgs e)
        {
            this.txtStartDate.Text = clndStartDate.SelectedDate.ToString();
            this.clndStartDate.Visible = false;
        }

        protected void imbEndDate_Click(object sender, ImageClickEventArgs e)
        {
            this.clndEndDate.Visible = !clndEndDate.Visible;
        }

        protected void clndEndDate_SelectionChanged(object sender, EventArgs e)
        {
            this.txtEndDate.Text = clndEndDate.SelectedDate.ToString();
            this.clndEndDate.Visible = false;
        }
        public DateTime StartDate {
            get {
                return Convert.ToDateTime (this.txtStartDate.Text);
            }
            set {
                this.txtStartDate.Text = value.ToString("MM/dd/yyyy");
            }
        }
        public DateTime EndDate
        {
            get
            {
                return Convert.ToDateTime(this.txtEndDate.Text);
            }
            set {
                this.txtEndDate.Text = value.ToString("MM/dd/yyyy");
            }
        }
        
    }
}