package com.hidenari.servletsample;

import jakarta.activation.DataHandler;
import jakarta.activation.FileDataSource;
import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

@WebServlet(urlPatterns = "/mailwith")
public class MailWithAttachServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        ServletContext app = getServletContext();
        Properties prop = new Properties();
        prop.setProperty("mail.smtp.host", "sandbox.smtp.mailtrap.io");
        prop.setProperty("mail.smtp.port", "2525");
        prop.setProperty("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(prop, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(
                        System.getenv("mail_user"),
                        System.getenv("mail_password"));
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);

            MimeMultipart multipart = new MimeMultipart();
            MimeBodyPart part = new MimeBodyPart();
            part.setText("添付ファイルメール");
            multipart.addBodyPart(part);

            MimeBodyPart attach = new MimeBodyPart();
            DataHandler handler = new DataHandler(
                    new FileDataSource(app.getRealPath("WEB-INF/attache/image.png"))
            );
            attach.setDataHandler(handler);
            attach.setFileName("logo.png");
            multipart.addBodyPart(attach);

            message.setFrom(new InternetAddress("from@test.com", "差出人"));
            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress("to@test.com", "鈴木一郎")
            );
            message.setSubject("test subject");
            message.setContent(multipart);
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("mail sent complete");
    }

}