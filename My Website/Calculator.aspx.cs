using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace My_Website
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button_Click(object sender, EventArgs e)
        {
            var button = (System.Web.UI.WebControls.Button)sender;
            txtDisplay.Text += button.Text;
        }

        protected void btnEqual_Click(object sender, EventArgs e)
        {
            try
            {
                var result = new System.Data.DataTable().Compute(txtDisplay.Text, null);
                txtDisplay.Text = result.ToString();
            }
            catch (Exception ex)
            {
                txtDisplay.Text = "Error";
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtDisplay.Text = string.Empty;
        }
    

}
}