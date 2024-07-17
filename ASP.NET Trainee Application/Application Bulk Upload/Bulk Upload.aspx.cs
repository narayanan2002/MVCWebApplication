using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Bulk_Upload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            int sessionCount = Convert.ToInt32(Application["SessionCount"]);
            lblUserCount.Text = sessionCount.ToString();   
            }
        }
        protected async void SubmitButton_Click(object sender, EventArgs e)
        {
           
            if (fileUpload.HasFile && Path.GetExtension(fileUpload.FileName) == ".xlsx")
            {
                ExcelPackage excelPackage = new ExcelPackage(fileUpload.PostedFile.InputStream);
                ExcelWorksheet worksheet = excelPackage.Workbook.Worksheets.FirstOrDefault();
                int startRow = 2;
                int endRow = worksheet.Dimension.End.Row;
                int successCount = 0;
                int duplicateCount = 0;
                DataTable dt = new DataTable();
                if (worksheet != null)
                {
                    dt.Columns.Add("FirstName");
                    dt.Columns.Add("LastName");
                    dt.Columns.Add("Gender");
                    dt.Columns.Add("DateOfBirth");
                    dt.Columns.Add("UserName");
                    dt.Columns.Add("Password");
                    dt.Columns.Add("RetypePassword");
                    dt.Columns.Add("Mobileno");
                    dt.Columns.Add("Address");
                    dt.Columns.Add("ModeOfPayment");
                    dt.Columns.Add("CardNumber");
                    dt.Columns.Add("NumberOnCard");
                    dt.Columns.Add("CVV");
                    dt.Columns.Add("ExpiryMonth");
                    dt.Columns.Add("ExpiryYear");
                    dt.Columns.Add("Country");
                    dt.Columns.Add("State");
                    dt.Columns.Add("City");
                    dt.Columns.Add("EmailID");
                    dt.Columns.Add("PhoneNumber");

                    var dataRows = worksheet.Cells[startRow, 1, endRow, 20].Select(cell => new
                    {
                        Row = cell.Start.Row,
                        Column = cell.Start.Column,
                        Value = cell.Text
                    })
                    .GroupBy(x => x.Row)
                    .Select(g => dt.Rows.Add(
                        g.FirstOrDefault(x => x.Column == 1)?.Value,
                        g.FirstOrDefault(x => x.Column == 2)?.Value,
                        g.FirstOrDefault(x => x.Column == 3)?.Value,
                        g.FirstOrDefault(x => x.Column == 4)?.Value,
                        g.FirstOrDefault(x => x.Column == 5)?.Value,
                        g.FirstOrDefault(x => x.Column == 6)?.Value,
                        g.FirstOrDefault(x => x.Column == 7)?.Value,
                        g.FirstOrDefault(x => x.Column == 8)?.Value,
                        g.FirstOrDefault(x => x.Column == 9)?.Value,
                        g.FirstOrDefault(x => x.Column == 10)?.Value,
                        g.FirstOrDefault(x => x.Column == 11)?.Value,
                        g.FirstOrDefault(x => x.Column == 12)?.Value,
                        g.FirstOrDefault(x => x.Column == 13)?.Value,
                        g.FirstOrDefault(x => x.Column == 14)?.Value,
                        g.FirstOrDefault(x => x.Column == 15)?.Value,
                        g.FirstOrDefault(x => x.Column == 16)?.Value,
                        g.FirstOrDefault(x => x.Column == 17)?.Value,
                        g.FirstOrDefault(x => x.Column == 18)?.Value,
                        g.FirstOrDefault(x => x.Column == 19)?.Value,
                        g.FirstOrDefault(x => x.Column == 20)?.Value
                    )).ToList();
                    List<Task> insertTasks = new List<Task>();
                    foreach (var row in dataRows)
                    {
                        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString);
                        SqlCommand cmd = new SqlCommand("narayanan_ms_RegisterUser", connection);
                        DateTime parsedDate;
                        if (DateTime.TryParseExact(row["DateOfBirth"].ToString(), "dd-MM-yyyy", null, System.Globalization.DateTimeStyles.None, out parsedDate))
                        {
                            string formattedDate = parsedDate.ToString("dd-MM-yyyy");
                            try
                            {
                                cmd.CommandType = CommandType.StoredProcedure;
                                cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = row["FirstName"];
                                cmd.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = row["LastName"];
                                cmd.Parameters.Add("@Gender", SqlDbType.NVarChar).Value = row["Gender"];
                                cmd.Parameters.Add("@DateOfBirth", SqlDbType.NVarChar).Value = formattedDate;

                                cmd.Parameters.Add("@UserName", SqlDbType.NVarChar).Value = row["UserName"];
                                cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = row["Password"];
                                cmd.Parameters.Add("@RetypePassword", SqlDbType.NVarChar).Value = row["RetypePassword"];
                                cmd.Parameters.Add("@Mobileno", SqlDbType.NVarChar).Value = row["Mobileno"];
                                cmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = row["Address"];
                                cmd.Parameters.Add("@ModeOfPayment", SqlDbType.NVarChar).Value = row["ModeOfPayment"];
                                cmd.Parameters.Add("@CardNumber", SqlDbType.NVarChar).Value = row["CardNumber"];
                                cmd.Parameters.Add("@NameOnCard", SqlDbType.NVarChar).Value = row["NumberOnCard"];
                                cmd.Parameters.Add("@CVV", SqlDbType.NVarChar).Value = row["CVV"];
                                cmd.Parameters.Add("@ExpiryMonth", SqlDbType.NVarChar).Value = row["ExpiryMonth"];
                                cmd.Parameters.Add("@ExpiryYear", SqlDbType.NVarChar).Value = row["ExpiryYear"];
                                cmd.Parameters.Add("@Country", SqlDbType.NVarChar).Value = row["Country"];
                                cmd.Parameters.Add("@State", SqlDbType.NVarChar).Value = row["State"];
                                cmd.Parameters.Add("@City", SqlDbType.NVarChar).Value = row["City"];
                                cmd.Parameters.Add("@EmailID", SqlDbType.NVarChar).Value = row["EmailID"];
                                cmd.Parameters.Add("@PhoneNumber", SqlDbType.NVarChar).Value = row["PhoneNumber"];

                                await connection.OpenAsync();
                                int result = await cmd.ExecuteNonQueryAsync();

                                if (result == 1)
                                {
                                    Interlocked.Increment(ref successCount);
                                }
                                else if (result == -1) 
                                {
                                    Interlocked.Increment(ref duplicateCount);
                                }
                                
                            }

                            catch (SqlException sqlEx)
                            {
                                if (sqlEx.Number == 2627 || sqlEx.Number == 2601)
                                {
                                    Interlocked.Increment(ref duplicateCount);
                                }
                                else
                                {
                                    throw new Exception("Error executing stored procedure: " + sqlEx.Message);
                                }
                            }
                            finally
                            {
                                
                                connection.Close();
                                connection.Dispose();
                                dt.Dispose();
                                startRow = 0;
                                endRow = 0;
                                excelPackage.Dispose();
                                dataRows = null;
                                worksheet.Dispose();
                                cmd.Dispose();
                                formattedDate = string.Empty;
                            }
                        }

                    }
                    ScriptManager.RegisterStartupScript(this, GetType(), "showPopup", "showPopup(" + successCount + ", " + duplicateCount + ");", true);
                }
            }
        }



        protected void DownloadTemplateButton_Click(object sender, EventArgs e)
        {
            var excelPackage = new ExcelPackage();
            ExcelWorksheet worksheet = excelPackage.Workbook.Worksheets.Add("User Details");
            ExcelRange range = worksheet.Cells["A1:T1"];


            {
                try
                {

                    worksheet.Cells["A1"].Value = "FirstName";
                    worksheet.Cells["B1"].Value = "LastName";
                    worksheet.Cells["C1"].Value = "Gender";
                    worksheet.Cells["D1"].Value = "DateOfBirth";
                    worksheet.Cells["E1"].Value = "UserName";
                    worksheet.Cells["F1"].Value = "Password";
                    worksheet.Cells["G1"].Value = "RetypePassword";
                    worksheet.Cells["H1"].Value = "Mobileno";
                    worksheet.Cells["I1"].Value = "Address";
                    worksheet.Cells["J1"].Value = "ModeOfPayment";
                    worksheet.Cells["K1"].Value = "CardNumber";
                    worksheet.Cells["L1"].Value = "NumberOnCard";
                    worksheet.Cells["M1"].Value = "CVV";
                    worksheet.Cells["N1"].Value = "ExpiryMonth";
                    worksheet.Cells["O1"].Value = "ExpiryYear";
                    worksheet.Cells["P1"].Value = "Country";
                    worksheet.Cells["Q1"].Value = "State";
                    worksheet.Cells["R1"].Value = "City";
                    worksheet.Cells["S1"].Value = "EmailID";
                    worksheet.Cells["T1"].Value = "PhoneNumber";

                    worksheet.Cells["A2"].Value = "Naren";
                    worksheet.Cells["B2"].Value = "Loga";
                    worksheet.Cells["C2"].Value = "Male";
                    worksheet.Cells["D2"].Value = "01-11-1990";
                    worksheet.Cells["E2"].Value = "narendude12";
                    worksheet.Cells["F2"].Value = "password@123";
                    worksheet.Cells["G2"].Value = "password@123";
                    worksheet.Cells["H2"].Value = "1234567890";
                    worksheet.Cells["I2"].Value = "123 Main St";
                    worksheet.Cells["J2"].Value = "Credit Card";
                    worksheet.Cells["K2"].Value = "1234567890123456";
                    worksheet.Cells["L2"].Value = "Naren Loga";
                    worksheet.Cells["M2"].Value = "123";
                    worksheet.Cells["N2"].Value = "12";
                    worksheet.Cells["O2"].Value = "2025";
                    worksheet.Cells["P2"].Value = "USA";
                    worksheet.Cells["Q2"].Value = "California";
                    worksheet.Cells["R2"].Value = "Los Angeles";
                    worksheet.Cells["S2"].Value = "johndoe@example.com";
                    worksheet.Cells["T2"].Value = "0987654321";


                    worksheet.Column(1).Width = 15;
                    worksheet.Column(2).Width = 15;
                    worksheet.Column(3).Width = 15;
                    worksheet.Column(4).Width = 15;
                    worksheet.Column(5).Width = 15;
                    worksheet.Column(6).Width = 15;
                    worksheet.Column(7).Width = 15;
                    worksheet.Column(8).Width = 15;
                    worksheet.Column(9).Width = 15;
                    worksheet.Column(10).Width = 15;
                    worksheet.Column(11).Width = 15;
                    worksheet.Column(12).Width = 15;
                    worksheet.Column(13).Width = 15;
                    worksheet.Column(14).Width = 15;
                    worksheet.Column(15).Width = 15;
                    worksheet.Column(16).Width = 15;
                    worksheet.Column(17).Width = 15;
                    worksheet.Column(18).Width = 15;
                    worksheet.Column(19).Width = 15;
                    worksheet.Column(20).Width = 15;

                    {
                        range.Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                        range.Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.Aquamarine);
                        range.Style.Font.Color.SetColor(System.Drawing.Color.Black);
                    }
                    Response.Clear();

                    Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    Response.AddHeader("content-disposition", "attachment;  filename=User Details.xlsx");
                    Response.BinaryWrite(excelPackage.GetAsByteArray());
                    Response.End();
                }
                catch (Exception ex)
                {
                    throw new Exception("Error processing Excel file: " + ex.Message);
                }
                finally
                {

                    excelPackage.Dispose();
                    worksheet.Dispose();
                    range.Dispose();
                }

            }
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
              Session.Clear();
              Response.Redirect("Login Form.aspx?logout=success");
           
        }

    }
}