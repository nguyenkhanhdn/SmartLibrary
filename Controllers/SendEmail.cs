using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace SmartLibrary.Controllers
{
    public class SendEmail
    {
        public static bool Send(string to, string msg)
        {
            bool status = true;
            try
            {
                SmtpClient SmtpServer = new SmtpClient("smtp.office365.com");
                var mail = new MailMessage();
                mail.From = new MailAddress("nguyenminhthu181222008@outlook.com");
                mail.To.Add(to);
                mail.Subject = "Nhắc nhỡ: học sinh mượn sách quá hạn.";
                mail.IsBodyHtml = true;
                string htmlBody;
                htmlBody = msg;
                mail.Body = htmlBody;
                SmtpServer.Port = 587;
                SmtpServer.UseDefaultCredentials = false;
                SmtpServer.Credentials = new System.Net.NetworkCredential("nguyenminhthu181222008@outlook.com", "minhthunguyen1812");
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);
            }
            catch (Exception ex)
            {
                status = false;
            }
            return status;
        }

        public static DataTable GetData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("GetStudentsToInform", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable table = new DataTable();
            da.Fill(table);
            return table;
        }
    }
}