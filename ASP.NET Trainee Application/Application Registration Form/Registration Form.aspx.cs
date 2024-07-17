using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.HtmlControls;
using System.Data.SqlTypes;
using System.Net.Mail;
using System.Drawing.Drawing2D;
using System.Web.Services.Description;
using System.Security.Cryptography;
using System.Text;

namespace WebApplication1
{


    public partial class Registration_Form : System.Web.UI.Page
    {
        protected void btnViewRegistration_Click(object sender, EventArgs e)
        {
            Response.Redirect("View Registration.aspx");
        }
        protected void btnNewRegistration_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration Form.aspx");
        }
        protected void btnbulkupload_Click(object sender, EventArgs e)
        {
            Response.Redirect("Bulk Upload.aspx");
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {    
            Session.Clear();
            Response.Redirect("Login Form.aspx?logout=success");
        }
        
        

        protected void btncancel_Click(object sender, EventArgs e)
        {
            string message = "✘ Registration Cancelled.";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", "displayPopup('" + message.Replace("'", "\\'") + "');", true);
            ClearFields();
        }
        
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            bool hasErrors = false;
            if (string.IsNullOrWhiteSpace(TextBox1.Text))
            {
                error1.Text = "The Firstname is Required";
                hasErrors = true;
            }

            if (string.IsNullOrWhiteSpace(TextBox2.Text))
            {
                error2.Text = "The Lastname is Required";
                hasErrors = true;
            }

            if (!RadioButton3.Checked && !RadioButton4.Checked)
            {
                error3.Text = "The Gender is Required";
                hasErrors = true;
            }

            if (string.IsNullOrWhiteSpace(TextBox7.Text) || string.IsNullOrWhiteSpace(TextBox8.Text) || string.IsNullOrWhiteSpace(TextBox9.Text))
            {
                error4.Text = "The Date of Birth is Required";
                hasErrors = true;
            }

            if (string.IsNullOrWhiteSpace(txtUsername.Text))
            {
                error5.Text = "The Username is Required";
                hasErrors = true;
            }

            if (string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                error6.Text = "The Password is Required";
                hasErrors = true;
            }

            if (string.IsNullOrWhiteSpace(txtConfirmpassword.Text))
            {
                error7.Text = "The Retype Password is Required";
                hasErrors = true;
            }

            if (!RadioButton1.Checked && !RadioButton2.Checked)
            {
                error10.Text = "The Mode of Payment is Required";
                hasErrors = true;
            }

            if (string.IsNullOrWhiteSpace(txtAddress.Text))
            {
                error9.Text = "The Address is Required";
                hasErrors = true;
            }

            if (string.IsNullOrWhiteSpace(TextBox3.Text))
            {
                error11.Text = "The Card Number is Required";
                hasErrors = true;
            }

            if (string.IsNullOrWhiteSpace(TextBox4.Text))
            {
                error12.Text = "The Name on Card is Required";
                hasErrors = true;
            }

            if (string.IsNullOrWhiteSpace(TextBox16.Text))
            {
                error13.Text = "The CVV is Required";
                hasErrors = true;
            }

            if (string.IsNullOrWhiteSpace(TextBox10.Text))
            {
                error19.Text = "The Month and Year is Required";
                hasErrors = true;
            }

            if (string.IsNullOrWhiteSpace(TextBox11.Text))
            {
                error19.Text = "The Month and Year is Required";
                hasErrors = true;
            }

            if (Country.SelectedValue == "")
            {
                error14.Text = "The Country is Required";
                hasErrors = true;
            }

            if (string.IsNullOrWhiteSpace(TextBox6.Text))
            {
                error8.Text = "The Mobile Number is Required";
                hasErrors = true;
            }

            if (State.SelectedValue == "")
            {
                error15.Text = "The State is Required";
                hasErrors = true;
            }

            if (City.SelectedValue == "")
            {
                error16.Text = "The City is Required";
                hasErrors = true;
            }

            if (string.IsNullOrWhiteSpace(email.Text))
            {
                error17.Text = "The Email is Required";
                hasErrors = true;
            }

            if (!chkTerms.Checked)
            {
                lblErrorMessage.Text = "You must agree to the terms and conditions";
                hasErrors = true;
            }

            if (!hasErrors)
            {

            }
            string firstName = TextBox1.Text.Trim();
            string lastName = TextBox2.Text.Trim();
            string gender = RadioButton3.Checked ? "Male" : "Female";
            string dateOfBirth = date_datumPrispetja.Value.Trim();
            string userName = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();
            string retypePassword = txtConfirmpassword.Text.Trim();
            string mobileNumber = TextBox6.Text.Trim();
            string address = txtAddress.Text.Trim();
            string modeOfPayment = RadioButton1.Checked ? "COD" : "Credit Card";
            string cardNumber = TextBox3.Text.Trim();
            string nameOnCard = TextBox4.Text.Trim();
            string dd = TextBox7.Text.Trim();
            string mm = TextBox8.Text.Trim();
            string yy = TextBox9.Text.Trim();
            string cvv = TextBox16.Text.Trim();
            string cremon = TextBox10.Text.Trim();
            string creyear = TextBox11.Text.Trim();
            string country = Country.Text.Trim();
            string state = State.Text.Trim();
            string city = City.Text.Trim();
            string emailId = email.Text.Trim();
            string phoneNumber = TextBox5.Text.Trim();
            string recipientEmail = emailId;
            string ccEmail = "mnpb143@gmail.com";
            string subject = "Registration Details";
            string paymentDetails = string.Empty;
            string successMessageTop = "✔ Registered Successfully";
            string successMessagefooter = "<p style='font-size:13px;color:blue;'><span style='font-size:13px;color:red;'>✉</span> Registration details have been sent to your registration email.</p>";
            string encodedMessageTop = HttpUtility.JavaScriptStringEncode(successMessageTop);
            string encodedMessageBottom = HttpUtility.JavaScriptStringEncode(successMessagefooter);


            if (chkTerms.Checked && !string.IsNullOrEmpty(userName) && RadioButton3.Checked || RadioButton4.Checked && RadioButton2.Checked || RadioButton1.Checked && !string.IsNullOrEmpty(dd) && !string.IsNullOrEmpty(mm) && !string.IsNullOrEmpty(yy)
            && !string.IsNullOrEmpty(firstName) && !string.IsNullOrEmpty(lastName) && !string.IsNullOrEmpty(password) && !string.IsNullOrEmpty(retypePassword) && !string.IsNullOrEmpty(address) && !string.IsNullOrEmpty(emailId) && !string.IsNullOrEmpty(mobileNumber))
            {
                DateTime parsedDate;

                if (DateTime.TryParse(dateOfBirth, out parsedDate))
                {
                    DateTime dateOnly = parsedDate.Date;
                    string formattedDate = dateOnly.ToString("dd-MM-yyyy");
                    string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;

                    SqlConnection connection = new SqlConnection(connectionString);
                    {
                        SqlCommand cmd = new SqlCommand("narayanan_ms_RegisterUser", connection);
                        MailMessage messages = new MailMessage();
                        if (modeOfPayment == "Credit Card")
                        {
                            paymentDetails = $@"
                            <tr>
                                <td><b >Card Number</b></td>
                                <td>{cardNumber}</td>
                            </tr>
                            <tr>
                                <td><b >Name on Card</b></td>
                                <td>{nameOnCard}</td>
                            </tr>
                            <tr>
                                <td><b >CVV</b></td>
                                <td>{cvv}</td>
                            </tr>
                            <tr>
                                <td><b >Expiry Month</b></td>
                                <td>{cremon}</td>
                            </tr>
                            <tr>
                                <td><b >Expiry Year</b></td>
                                <td>{creyear}</td>
                            </tr>";
                        }
                        string body = $@"

                        <html>
                        <body>
                        <table border='1' cellpadding='3' cellspacing='0' style='border-collapse: collapse; width: 80%;text-align:center;'>
                        <tr style='background-color:Aquamarine;font-size:14px;'>
                            <th colspan='2'><b >Registration Details</b></th>
                        </tr>
                        <tr>
                            <td><b >First Name</b></td>
                            <td>{firstName}</td>
                        </tr>
                        <tr>
                            <td><b >Last Name</b></td>
                            <td>{lastName}</td>
                        </tr>
                        <tr>
                            <td><b >Gender</b></td>
                            <td>{gender}</td>
                        </tr>
                        <tr>
                            <td><b >Date of Birth</b></td>
                            <td>{dateOfBirth}</td>
                        </tr>
                        <tr>
                            <td><b >Username</b></td>
                            <td>{userName}</td>
                        </tr>
                        <tr>
                            <td><b >Mobile Number</b></td>
                            <td>{mobileNumber}</td>
                        </tr>
                        <tr>
                            <td><b >Address</b></td>
                            <td>{address}</td>
                        </tr>
                        <tr>
                            <td><b >Mode of Payment</b></td>
                            <td>{modeOfPayment}</td>
                        </tr>
                                    {paymentDetails}

                        <tr>
                            <td><b >Country</b></td>
                            <td>{country}</td>
                        </tr>
                        <tr>
                            <td><b >State</b></td>
                            <td>{state}</td>
                        </tr>
                        <tr>
                            <td><b >City</b></td>
                            <td>{city}</td>
                        </tr>
                        <tr>
                            <td><b >Email Id</b></td>
                            <td>{emailId}</td>
                        </tr>
                        <tr>
                            <td><b >Phone Number</b></td>
                            <td>{phoneNumber}</td>
                        </tr>
            
                        </table>
                        </body>
                        </html>";


                        {
                            messages.From = new MailAddress("test.admin@plintron.com");
                            if (!string.IsNullOrEmpty(recipientEmail))
                            {
                                messages.To.Add(new MailAddress(recipientEmail));
                            }

                            if (!string.IsNullOrEmpty(ccEmail))
                            {
                                messages.CC.Add(new MailAddress(ccEmail));
                            }

                            messages.Subject = subject;
                            messages.Body = body;
                            messages.IsBodyHtml = true;

                            SmtpClient smtp = new SmtpClient();
                            {
                                smtp.Send(messages);
                            }

                        }
                        try
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = firstName;
                            cmd.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = lastName;
                            cmd.Parameters.Add("@Gender", SqlDbType.NVarChar).Value = gender;

                            cmd.Parameters.Add("@DateOfBirth", SqlDbType.NVarChar).Value = formattedDate;

                            cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = userName;
                            cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = HashPassword(password);
                            cmd.Parameters.Add("@Retypepassword", SqlDbType.NVarChar).Value = HashPassword(retypePassword);
                            cmd.Parameters.Add("@Mobileno", SqlDbType.NVarChar).Value = mobileNumber;
                            cmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = address;
                            cmd.Parameters.Add("@ModeOfPayment", SqlDbType.NVarChar).Value = modeOfPayment;
                            cmd.Parameters.Add("@CardNumber", SqlDbType.NVarChar).Value = cardNumber;
                            cmd.Parameters.Add("@NameOnCard", SqlDbType.NVarChar).Value = nameOnCard;
                            cmd.Parameters.Add("@CVV", SqlDbType.NVarChar).Value = cvv;
                            cmd.Parameters.Add("@ExpiryMonth", SqlDbType.NVarChar).Value = cremon;
                            cmd.Parameters.Add("@ExpiryYear", SqlDbType.NVarChar).Value = creyear;
                            cmd.Parameters.Add("@Country", SqlDbType.NVarChar).Value = country;
                            cmd.Parameters.Add("@State", SqlDbType.NVarChar).Value = state;
                            cmd.Parameters.Add("@City", SqlDbType.NVarChar).Value = city;
                            cmd.Parameters.Add("@EmailID", SqlDbType.NVarChar).Value = emailId;
                            cmd.Parameters.Add("@PhoneNumber", SqlDbType.NVarChar).Value = phoneNumber;
                            
                            connection.Open();
                            cmd.ExecuteNonQuery();
                            ClearFields();
                            lblErrorMessage.Visible = false;
                            
                            ClientScript.RegisterStartupScript(this.GetType(), "displaySuccessPopup", $"displaySuccessPopup(\"{encodedMessageTop}\", \"{encodedMessageBottom}\");", true);
                        }
                        catch (Exception ex)
                        {
                            if (ex.Message.Contains("duplicate key"))
                            {
                                string duplicateMessage = "✘ Username Already Registered";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "DuplicateUserScript", "displayPopup('" + duplicateMessage.Replace("'", "\\'") + "');", true);
                            }
                            else
                            {
                                string genericMessage = "✘ An error occurred: " + ex.Message;
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "GenericErrorScript", "displayPopup('" + genericMessage.Replace("'", "\\'") + "');", true);
                            }
                            ClearFields();
                        }
                        finally
                        {
                            firstName = string.Empty;
                            lastName = string.Empty;
                            gender = string.Empty;
                            dateOfBirth = string.Empty;
                            userName = string.Empty;
                            password = string.Empty;
                            retypePassword = string.Empty;
                            emailId = string.Empty;
                            phoneNumber = string.Empty;
                            country = string.Empty;
                            state = string.Empty;
                            city = string.Empty;
                            mobileNumber = string.Empty;
                            modeOfPayment = string.Empty;
                            nameOnCard = string.Empty;
                            cvv = string.Empty;
                            nameOnCard = string.Empty;
                            address = string.Empty;
                            cremon = string.Empty;
                            dd = string.Empty;
                            mm = string.Empty;
                            formattedDate = string.Empty;
                            dateOnly = DateTime.MinValue;
                            parsedDate= DateTime.MinValue;
                            yy = string.Empty;
                            creyear = string.Empty;
                            recipientEmail = string.Empty;
                            ccEmail = string.Empty;
                            paymentDetails = string.Empty;
                            subject = string.Empty;
                            messages.Dispose();
                            connectionString = string.Empty;
                            successMessageTop =string.Empty ;
                            successMessagefooter = string.Empty;
                            encodedMessageTop = string.Empty;
                            connectionString= string.Empty;
                            encodedMessageBottom = string.Empty;
                            ClearFields();
                            connection.Close();
                            connection.Dispose();
                            cmd.Dispose();

                        }
                    }
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)

        {
            int sessionCount = Convert.ToInt32(Application["SessionCount"]);
            lblUserCount.Text = sessionCount.ToString();
            XmlDocument countryList = new XmlDocument();

            if (!IsPostBack)
            {
                if (Country.Items.Count == 0)
                {
                    try
                    {
                        countryList.Load(Server.MapPath("Locations/country.xml"));
                        Country.Items.Add(new ListItem("", ""));
                        foreach (XmlNode country in countryList.SelectNodes("/Countries/Country"))
                        {
                            Country.Items.Add(new ListItem(country.Attributes["name"].Value, country.Attributes["name"].Value));
                        }
                    }
                    catch (Exception ex)
                    {

                        string genericMessage = "✘ An error occurred: " + ex.Message;
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "GenericErrorScript", "displayPopup('" + genericMessage.Replace("'", "\\'") + "');", true);

                    }
                    finally
                    {
                        countryList = null;
                      
                    }
                }
            }
        }
        protected void Country_SelectedIndexChanged(object sender, EventArgs e)

        {
            XmlDocument doc = new XmlDocument();
            doc.Load(Server.MapPath("~/Locations/country.xml"));
            var stateNode = doc.SelectSingleNode($"/Countries/Country[@name='{Country.SelectedValue}']");
            try
            {

                State.Items.Clear();

                City.Items.Clear();

                if (stateNode != null)

                {

                    State.Items.Add(new ListItem("", ""));

                    foreach (XmlNode node in stateNode.ChildNodes)

                    {

                        State.Items.Add(new ListItem(node.Attributes["name"].Value, node.Attributes["name"].Value));

                    }

                }
            }
            catch (Exception ex)
            {

                string genericMessage = "✘ An error occurred: " + ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "GenericErrorScript", "displayPopup('" + genericMessage.Replace("'", "\\'") + "');", true);

            }
            finally
            {
                doc = null;
                stateNode = null;
            }

        }
        protected void State_SelectedIndexChanged(object sender, EventArgs e)

        {
            XmlDocument doc = new XmlDocument();
            doc.Load(Server.MapPath("~/Locations/country.xml"));
            var cityNode = doc.SelectSingleNode($"/Countries/Country[@name='{Country.SelectedValue}']/State[@name='{State.SelectedValue}']");
            try
            {
                City.Items.Clear();

                if (cityNode != null)

                {

                    City.Items.Add(new ListItem("", ""));

                    foreach (XmlNode node in cityNode.ChildNodes)

                    {

                        City.Items.Add(new ListItem(node.InnerText, node.InnerText));

                    }

                }
            }
            catch (Exception ex)
            {

                string genericMessage = "✘ An error occurred: " + ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "GenericErrorScript", "displayPopup('" + genericMessage.Replace("'", "\\'") + "');", true);

            }
            finally
            {
                doc = null;
                cityNode = null;
            }

        }
        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }
   
private void ClearFields()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            RadioButton3.Checked = false;
            RadioButton4.Checked = false;
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtConfirmpassword.Text = "";
            TextBox6.Text = "";
            txtAddress.Text = "";
            RadioButton1.Checked = false;
            RadioButton2.Checked = false;
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox16.Text = "";
            TextBox10.Text = "";
            TextBox11.Text = "";
            Country.SelectedIndex = -1;
            State.SelectedIndex = -1;
            City.SelectedIndex = -1;
            email.Text = "";
            TextBox5.Text = "";
            chkTerms.Checked = false;
        }

    }
}