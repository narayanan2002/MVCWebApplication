using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Reflection;
using System.Web.Mvc;
using System.Web.Services.Description;
using Application1.Models;

namespace Application1.Controllers
{
    public class RegisterController : Controller
    {
        
        public ActionResult Register()
        {
            LogMessage("Registration Page accessed.");

            return View();
        }

        [HttpPost]
        public ActionResult Register(RegisterModel model)
        {
            string connectionString = string.Empty;
            SqlConnection connection = null;
            SqlCommand cmd = null;

            try
            {
                connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
                connection = new SqlConnection(connectionString);
                {
                    cmd = new SqlCommand("narayanan_ms_Registers", connection);
                    {
                        connection.Open();
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@FirstName", model.FirstName);
                        cmd.Parameters.AddWithValue("@LastName", model.LastName);
                        cmd.Parameters.AddWithValue("@Username", model.Username);
                        cmd.Parameters.AddWithValue("@PhoneNumber", model.PhoneNumber);
                        cmd.Parameters.AddWithValue("@EmailId", model.EmailId);

                        cmd.ExecuteNonQuery();
                        LogMessage("Success:Data Registration Successfully");

                        return Json(new { success = true });
                    }
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("duplicate key"))
                {
                    LogMessage("Register Error: Username already registered");
                    return Json(new { success = false, message = "Username Already Registered"});
                }
                else {
                    LogMessage($"Register Error: {ex.Message}");

                    return Json(new { success = false, message = ex.Message });

                }
            }
            finally
            {
                connection.Close();
                connection.Dispose();
                cmd.Dispose();
                connectionString = string.Empty;
            }


        }

        [HttpGet]
        public ActionResult ViewDetails()
        {
            string connectionString = string.Empty;
            SqlConnection connection = null;
            SqlCommand cmd = null;
            SqlDataReader reader = null;
            List<RegisterModel> registeredUsers = null;
            try
            {
                connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
                connection = new SqlConnection(connectionString);
                registeredUsers = new List<RegisterModel>();
                {
                    cmd = new SqlCommand("narayanan_ms_viewdetails", connection);
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        connection.Open();
                        reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            registeredUsers.Add(new RegisterModel
                            {
                                SNo = int.Parse(reader["SNo"].ToString()),
                                FirstName = reader["FirstName"].ToString(),
                                LastName = reader["LastName"].ToString(),
                                Username = reader["Username"].ToString(),
                                PhoneNumber = reader["PhoneNumber"].ToString(),
                                EmailId = reader["EmailId"].ToString(),


                            });
                        }
                    }
                }
                LogMessage("Success: View Detail accessed.");

                return Json(new { success = true, data = registeredUsers }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                LogMessage($"View Error: {ex.Message}");
                return Json(new { success = false, message = ex.Message });
            }
            finally
            {
                connection.Close();
                connection.Dispose();
                cmd.Dispose();
                connectionString = string.Empty;
                reader = null;
                registeredUsers = null;
            }

        }

       
        [HttpPost]
        public ActionResult UpdateDetails(RegisterModel model)
        {
            string connectionString = string.Empty;
            SqlConnection connection = null;
            SqlCommand cmd = null;

            try
            {
                connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
                connection = new SqlConnection(connectionString);
                {
                    cmd = new SqlCommand("narayanan_ms_dataupdate", connection);
                    {
                        connection.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@SNo", model.SNo);
                        cmd.Parameters.AddWithValue("@FirstName", model.FirstName );
                        cmd.Parameters.AddWithValue("@LastName",model.LastName );
                        cmd.Parameters.AddWithValue("@Username", model.Username);
                        cmd.Parameters.AddWithValue("@PhoneNumber",model.PhoneNumber );
                        cmd.Parameters.AddWithValue("@EmailID",model.EmailId);

                        cmd.ExecuteNonQuery();
                        LogMessage("Success: Data Update Successfully");

                        return Json(new { success = true });
                    }
                }
            }
            catch (Exception ex)
            {
                LogMessage($"Update Error: {ex.Message}");
                return Json(new { success = false, message = ex.Message });
            }
            finally
            {
                connection.Close();
                connection.Dispose();
                cmd.Dispose();
                connectionString = string.Empty;
            }

        }
       
        [HttpPost]
        public ActionResult DeleteDetails(int sno)
        {
            string connectionString = string.Empty;
            SqlConnection connection = null;
            SqlCommand cmd = null;
            try
            {
               connectionString = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
                connection = new SqlConnection(connectionString);
                {
                   cmd = new SqlCommand("narayanan_ms_deletedetails", connection);
                    {
                        connection.Open();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@SNo", sno);
                        cmd.ExecuteNonQuery();
                    }
                }
                LogMessage("Success: Data Deleted Successfully");
                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                LogMessage($"Delete Error: {ex.Message}");
                return Json(new { success = false, message = ex.Message });
            }
            finally
            {

                connectionString = string.Empty;
                connection.Dispose();
                cmd.Dispose();
                connection.Close();
            }
        }
        private void LogMessage(string message)
        {
            string logFilePath = Server.MapPath("~/App_Data/Log File.txt");
            StreamWriter writer = new StreamWriter(logFilePath, true);
            {
                writer.WriteLine($"{DateTime.Now}: {message}");
            }
        }
    }
}