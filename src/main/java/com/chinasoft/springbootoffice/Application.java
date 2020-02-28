package com.chinasoft.springbootoffice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.support.SpringBootServletInitializer;


@SpringBootApplication
@ServletComponentScan
public class  Application extends SpringBootServletInitializer {
/*通用 配置启动类*/
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}
