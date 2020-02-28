package com.chinasoft.springbootoffice.controller;
import java.util.UUID;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.jodconverter.DocumentConverter;
import org.jodconverter.office.OfficeException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class OfficeController {
    // 第一步：转换器直接注入
    @Autowired
    private DocumentConverter converter;

    @Autowired
    private HttpServletResponse response;

    String pdfUrl=Thread.currentThread().getContextClassLoader().getResource("").getPath().replace("target/classes/", "")
            +"/obj-pdf/";
    String pdfFileName=pdfUrl +UUID.randomUUID().toString().replace("-", "")+".pdf" ;
    @RequestMapping("toPdfFile/{firstFileName}/{lastFileName}")
    @ResponseBody
    public void toPdfFile(HttpServletRequest request,
                          @PathVariable("firstFileName") String firstFileName,
                          @PathVariable("lastFileName") String lastFileName) {
        String fileName=firstFileName+"."+lastFileName;
        File file = new File("src/main/resources/upload/"+fileName);//需要转换的文件
        try {
            File newFile = new File(pdfUrl);//转换之后文件生成的地址
            if (!newFile.exists()) {
                newFile.mkdirs();
            }
            //文件转化
            converter.convert(file).to(new File(pdfFileName)).execute();
            //使用response,将pdf文件以流的方式发送的前段
            ServletOutputStream outputStream = response.getOutputStream();
            InputStream in = new FileInputStream(new File(pdfFileName));// 读取文件
            // copy文件
            int i = IOUtils.copy(in, outputStream);
            System.out.println(i);
            in.close();
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


}
