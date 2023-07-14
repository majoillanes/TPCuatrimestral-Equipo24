using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;
using System.Net;



namespace Test
{
    public class EmailHelp
    {
        private MailMessage email;
        private SmtpClient server;

        public EmailHelp()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("albumlpf@outlook.es", "LPFAlbum123");
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp-mail.outlook.com";
        }

        public void armarEmail(string remitente, string asunto, string mensaje)
        {
            email = new MailMessage();
            email.From = new MailAddress(remitente);
            email.To.Add("albumlpf@outlook.es");
            email.Subject = asunto;
            email.IsBodyHtml = true;
            email.Body = mensaje;

            //enviarEmail();
        }

        public void enviarEmail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

