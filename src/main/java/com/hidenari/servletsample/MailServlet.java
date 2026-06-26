package com.hidenari.servletsample;

import jakarta.mail.*;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

@WebServlet(urlPatterns = "/mail")
public class MailServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
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
            message.setFrom(new InternetAddress("from@test.com", "差出人"));
            message.addRecipient(Message.RecipientType.TO,
                    new InternetAddress("to@test.com", "鈴木一郎")
            );
            message.setSubject("test subject");
            message.setText("test text");
            Transport.send(message);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("mail sent complete");
    }

}