using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class View_Registration : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            int sessionCount = Convert.ToInt32(Application["SessionCount"]);
            lblUserCount.Text = sessionCount.ToString();
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gridService.EditIndex = -1;
            BindGrid();
        }

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
           
            Response.Redirect("Login Form.aspx?logout=success");
            Session.Clear();    
        }

        private void BindGrid()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            if (string.IsNullOrWhiteSpace(date1.Value))
            {
                error11.Text = "The FromDate is Required";
            }
            else
            {
                error11.Text = "";
            }
            if (string.IsNullOrWhiteSpace(date2.Value))
            {
                error12.Text = "The ToDate is Required";
            }
            else
            {
                error12.Text = "";
            }

            DateTime? fromDate = null;
            if (!string.IsNullOrEmpty(date1.Value))
            {
                fromDate = DateTime.Parse(date1.Value);
            }
            DateTime? toDate = null;
            if (!string.IsNullOrEmpty(date2.Value))
            {
                toDate = DateTime.Parse(date2.Value);
            }

            string firstName = TextBox14.Text;
            string lastName = TextBox13.Text;
            DateTime? dateOfBirth = null;
            if (!string.IsNullOrEmpty(date3.Value) && DateTime.TryParse(date3.Value, out DateTime tempDateOfBirth))
            {
                dateOfBirth = tempDateOfBirth;
            }
            string country = TextBox15.Text;
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("narayanan_ms_ViewRegistrations", connection);
            try
            {   
                
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@FromDate", fromDate);
                cmd.Parameters.AddWithValue("@ToDate", toDate);
                cmd.Parameters.AddWithValue("@FirstName", string.IsNullOrEmpty(firstName) ? (object)DBNull.Value : firstName);
                cmd.Parameters.AddWithValue("@Country", string.IsNullOrEmpty(country) ? (object)DBNull.Value : country);
                cmd.Parameters.AddWithValue("@LastName", string.IsNullOrEmpty(lastName) ? (object)DBNull.Value : lastName);

                if (dateOfBirth.HasValue)
                {
                    cmd.Parameters.Add("@DateOfBirth", SqlDbType.NVarChar).Value = dateOfBirth.Value.ToString("dd-MM-yyyy");
                }

                connection.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                DataTable dataTable = new DataTable();
                dataTable.Load(reader);

                if (dataTable.Rows.Count == 0)
                {
                    hiddenNoDataFound.Value = "true";
                    gridService.DataSource = null;
                    gridService.DataBind();
                }
                else
                {
                    hiddenNoDataFound.Value = "false";
                    gridService.DataSource = dataTable;
                    gridService.DataBind();
                }
            
            }
            catch (Exception ex)
            {
                string message = "Error updating record: " + ex.Message;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", "displayPopup('" + message + "');", true);
            }
            finally
            {
                fromDate = null;
                toDate = null;
                firstName = string.Empty;
                country = string.Empty;
                lastName = string.Empty;
                dateOfBirth = null;
                connection.Close();
                connection.Dispose();
                cmd.Dispose();


            }

        }
        protected void gridService_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridService.PageIndex = e.NewPageIndex;
            BindGrid();
        }
        protected void gridService_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridService.EditIndex = e.NewEditIndex;
            BindGrid();
        }
        protected void gridService_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && (e.Row.RowState & DataControlRowState.Edit) == DataControlRowState.Edit)
            {
                DropDownList ddlGender = null;
                DropDownList ddlCountry = null;
                string currentCountry = DataBinder.Eval(e.Row.DataItem, "Country").ToString();
                string currentGender = DataBinder.Eval(e.Row.DataItem, "Gender").ToString();

                try
                {
                    ddlGender = (DropDownList)e.Row.FindControl("ddlGender");
                    if (ddlGender != null)
                    {
                        ddlGender.SelectedValue = currentGender;
                    }

                    ddlCountry = (DropDownList)e.Row.FindControl("ddlCountry");
                    if (ddlCountry != null)
                    {
                        List<string> countries = new List<string> { "USA", "Canada", "UK", "France", "Germany" };

                        ddlCountry.DataSource = countries;
                        ddlCountry.DataBind();

                        if (!string.IsNullOrEmpty(currentCountry))
                        {
                            if (!countries.Contains(currentCountry))
                            {
                                ddlCountry.Items.Add(new ListItem(currentCountry, currentCountry));
                            }
                            ddlCountry.SelectedValue = currentCountry;
                        }
                    }
                }
                catch (Exception ex)
                {
                    string message = "Error updating record: " + ex.Message;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", "displayPopup('" + message + "');", true);
                }
                finally
                {
                    if (ddlGender != null)
                    {
                        ddlGender.ClearSelection();
                        var defaultGenderItem = ddlGender.Items.FindByValue("defaultGender"); 
                        if (defaultGenderItem != null)
                        {
                            defaultGenderItem.Selected = true;
                        }
                    }

                    if (ddlCountry != null)
                    {
                        ddlCountry.ClearSelection();
                        var defaultCountryItem = ddlCountry.Items.FindByValue("defaultCountry"); 
                        if (defaultCountryItem != null)
                        {
                            defaultCountryItem.Selected = true;
                        }
                    }
                    currentCountry = string.Empty;
                    currentGender = string.Empty;

                }
            }
        }


        protected void gridService_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            GridViewRow row = gridService.Rows[e.RowIndex];
            string firstName = ((TextBox)row.Cells[0].Controls[0]).Text;
            string lastName = ((TextBox)row.Cells[1].Controls[0]).Text;
            DropDownList ddlGender = (DropDownList)row.FindControl("ddlGender");
            string gender = ddlGender.SelectedValue;
            string dateOfBirth = ((TextBox)row.Cells[3].Controls[0]).Text;
            TextBox txtEditUsername = (TextBox)gridService.Rows[e.RowIndex].FindControl("txtEditUsername");
            string username = txtEditUsername.Text.Trim();
            string mobileNumber = ((TextBox)row.Cells[5].Controls[0]).Text;
            string address = ((TextBox)row.Cells[6].Controls[0]).Text;
            DropDownList ddlCountry = (DropDownList)row.FindControl("ddlCountry");
            string country = ddlCountry.SelectedValue;
            string emailID = ((TextBox)row.Cells[8].Controls[0]).Text;
            DateTime dateOfBirths;
            if (!DateTime.TryParseExact(dateOfBirth, "dd-MM-yyyy", null, DateTimeStyles.None, out dateOfBirths))
            {
                string messages = "Invalid Date Format. Please use dd-MM-yyyy.";
                ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", "displayPopup('" + messages + "');", true);
                return;
            }
            Regex numberRegex = new Regex(@"^\d{10}$");
            if (!numberRegex.IsMatch(mobileNumber))
            {
                string messages = "Mobile Number must be a 10-digit numeric value.";
                ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", "displayPopup('" + messages + "');", true);
                return;
            }
            Regex emailRegex = new Regex(@"^[a-zA-Z0-9._]+@[a-zA-Z]+\.[a-zA-Z]{2,}$");
            if (!emailRegex.IsMatch(emailID))
            {
                string messages = "Invalid Email Format. Please enter a valid email address.";
                ClientScript.RegisterStartupScript(this.GetType(), "PopupScript", "displayPopup('" + messages + "');", true);
                return;
            }
            string messagess = "Record updated successfully.";


            string dobFormatted = dateOfBirths.ToString("dd-MM-yyyy");
            SqlConnection connection = new SqlConnection(connectionString);

            {
                SqlCommand cmd = new SqlCommand("narayanan_ms_Updateuserdetails", connection);

                try
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@DateOfBirth", dobFormatted);
                    cmd.Parameters.AddWithValue("@Username", username);
                    cmd.Parameters.AddWithValue("@MobileNumber", mobileNumber);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@Country", country);
                    cmd.Parameters.AddWithValue("@EmailID", emailID);
                    connection.Open();
                    cmd.ExecuteNonQuery();
                    gridService.EditIndex = -1;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", "displayPopup('" + messagess + "');", true);
                    BindGrid();
                }
                catch (Exception ex)
                {
                    string message = "Error updating record: " + ex.Message;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", "displayPopup('" + message + "');", true);
                }
                finally
                {
                    firstName = string.Empty;
                    lastName = string.Empty;
                    gender = string.Empty;
                    emailID = string.Empty;
                    address = string.Empty;
                    country = string.Empty;
                    address = string.Empty;
                    mobileNumber = string.Empty;
                    username = string.Empty;
                    dateOfBirth = null;
                    dobFormatted = string.Empty;
                    string messages = string.Empty;
                    ddlGender.Dispose();
                    ddlCountry.Dispose();
                    txtEditUsername.Dispose();
                    messagess = string.Empty;
                    numberRegex = null;
                    emailRegex = null;
                    connectionString = string.Empty;
                    row.Dispose();
                    connection.Close();
                    connection.Dispose();
                    cmd.Dispose();
                              
                }
            }
        }

        protected void gridService_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridService.EditIndex = -1;
            BindGrid();
        }

        protected void gridService_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
            GridViewRow row = gridService.Rows[e.RowIndex];

            TextBox txtUsername = (TextBox)row.FindControl("txtUsername");
            string username = txtUsername.Text.Trim();
            string messages = "Record Deleted Successfully ";

            SqlConnection connection = new SqlConnection(connectionString);
            {
                SqlCommand cmdLog = new SqlCommand("narayanan_ms_deleteuserdetails", connection);

                try
                {
                    cmdLog.CommandType = CommandType.StoredProcedure;
                    cmdLog.Parameters.AddWithValue("@Username", username);
                    cmdLog.Parameters.AddWithValue("@Action", "Delete");
                    connection.Open();
                    cmdLog.ExecuteNonQuery();
                    gridService.DataBind();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", "displayPopup('" + messages + "');", true);
                    BindGrid();


                }
                catch (Exception ex)
                {
                    string message = "Error updating record: " + ex.Message;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "PopupScript", "displayPopup('" + message + "');", true);
                }
                finally
                {
                    username = string.Empty;
                    connection.Close();
                    connection.Dispose();
                    cmdLog.Dispose();
                    txtUsername.Dispose();
                    messages = string.Empty;
                    connectionString = string.Empty;
                    row.Dispose();

                }
            }

        }
    }
}