package com.hidenari.servletsample;

import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfDocumentInfo;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.element.Text;
import com.itextpdf.layout.properties.TextAlignment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(urlPatterns = "/pdf")
public class PdfServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        PdfDocument pdf = new PdfDocument(
                new PdfWriter(response.getOutputStream()));
        PdfDocumentInfo info = pdf.getDocumentInfo();
        info.setTitle("iText タイトル")
                .setSubject("iText サブジェクト")
                .setAuthor("taro");
        Document doc = new Document(pdf);
        PdfFont font = PdfFontFactory.createFont("HeiseiKakuGo-W5", "UniJIS-UCS2-H");
        doc.setFont(font);
        doc.add(new Paragraph("こんにちは、")
                .add(new Text("Java")
                        .setFontSize(20)
                        .setFontColor(new DeviceRgb(255, 0, 0))
                ));
        doc.add(new Paragraph("2行目"));
        Table table = new Table(new float[]{150, 200, 300});
        String[] hedears = {"one", "two", "three"};
        for (String head : hedears) {
            Cell cell = new Cell();
            cell.setFontSize(12)
                    .setTextAlignment(TextAlignment.CENTER)
                    .add(new Paragraph(head));
            table.addHeaderCell(cell);
        }
        for (int i = 0; i < 20; i++) {
            String[] datas = {"ichi:" + i, "ni:" + i, "san:" + i};
            for (String data : datas) {
                Cell dCell = new Cell();
                dCell.add(new Paragraph(data));
                table.addCell(dCell);
            }
        }
        doc.add(table);
        doc.close();
    }

}