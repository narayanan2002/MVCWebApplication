using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.Mvc;
using Application1.Models;

namespace Application1.Controllers
{
    public class HomeController : Controller
    {
        private void LogMessage(string message)
        {
            string logFilePath = Server.MapPath("~/App_Data/Log File.txt");
            StreamWriter writer = new StreamWriter(logFilePath, true);
            {
                writer.WriteLine($"{DateTime.Now}: {message}");
            }
        }
        public ActionResult Index()
        {
            LogMessage("Login Page accessed.");
            return View();
        }

        [HttpPost]
        public ActionResult Index(Class1 model)
        {
            string connStr = string.Empty;
            bool isValid = false;
            SqlConnection conn = null;
            SqlCommand cmd = null;
            SqlParameter resultParam = null;

            try
            {
                connStr = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
                conn = new SqlConnection(connStr);
                cmd = new SqlCommand("narayanan_ms_loginpage", conn);
                conn.Open();
                resultParam = new SqlParameter("@Result", System.Data.SqlDbType.Int)
                {
                    Direction = System.Data.ParameterDirection.Output
                };
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Username", model.Username);
                cmd.Parameters.AddWithValue("@Password", model.Password);
                cmd.Parameters.Add(resultParam);
                cmd.ExecuteNonQuery();
                isValid = (int)resultParam.Value == 1;

                if (isValid)
                {
                    return Json(new { success = true });
                }
                else
                {
                    return Json(new { success = false, message = "Invalid Username or Password" });
                }
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = ex.Message });
            }
            finally
            {
                conn.Close();
                isValid = false;
                connStr = string.Empty;
                conn.Dispose();
                resultParam = null;
                cmd.Dispose();
                conn.Dispose();
            }
        }
    }
}
