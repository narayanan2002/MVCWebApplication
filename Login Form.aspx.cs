using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Web;

namespace WebApplication1
{
    public partial class WebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["userid"] != null)
                    txtUsername.Text = Request.Cookies["userid"].Value;
                if (Request.Cookies["pwd"] != null)
                    txtPassword.Attributes.Add("value", Request.Cookies["pwd"].Value);
                if (Request.Cookies["userid"] != null && Request.Cookies["pwd"] != null)
                    chkRememberMe.Checked = true;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string expectedUsername = ConfigurationManager.AppSettings["Username"];
            string expectedPassword = ConfigurationManager.AppSettings["Password"];
            string enteredUsername = txtUsername.Text.Trim();
            string enteredPassword = txtPassword.Text.Trim();
            bool rememberMe = chkRememberMe.Checked;
            
            try
            {
                if (enteredUsername == expectedUsername && enteredPassword == expectedPassword)
                {
                    if (rememberMe)
                    {
                        HttpCookie usernameCookie = new HttpCookie("Username", enteredUsername);
                        HttpCookie passwordCookie = new HttpCookie("Password", enteredPassword);
                        usernameCookie.Expires = DateTime.Now.AddDays(30);
                        passwordCookie.Expires = DateTime.Now.AddDays(30);
                        Response.Cookies.Add(usernameCookie);
                        Response.Cookies.Add(passwordCookie);
                    }
                    lblMessage.Text = "";

                    Response.Redirect("Registration Form.aspx");
                }
                else
                {
                    if (Request.Cookies["Username"] != null)
                    {
                        HttpCookie usernameCookie = new HttpCookie("Username");
                        usernameCookie.Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies.Add(usernameCookie);
                    }


                    if (enteredPassword != expectedPassword)
                    {
                        lblMessage.Text = "Invalid Password!";
                        lblMessage.CssClass = "custom-font center-align";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    if (enteredUsername != expectedUsername)
                    {
                        lblMessage.Text = "Invalid User Name!";
                        lblMessage.CssClass = "custom-font center-align";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        txtUsername.Text = string.Empty;
                    }
                    if (enteredUsername != expectedUsername && enteredPassword != expectedPassword)

                    {
                        lblMessage.Text = "Invalid User!";
                        lblMessage.CssClass = "custom-font center-align";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }

                    if (Request.Cookies["Password"] != null)
                    {
                        HttpCookie passwordCookie = new HttpCookie("Password");
                        passwordCookie.Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies.Add(passwordCookie);
                    }
                }

            }
            catch (Exception ex)
            {
                lblMessage.CssClass = "custom-font center-align";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "An error occurred while processing your request.";
            }
            finally
            {
                expectedUsername = string.Empty;
                expectedPassword = string.Empty;
                enteredUsername = string.Empty;
                enteredPassword = string.Empty;
                rememberMe = false;


            }
        }

    }

}