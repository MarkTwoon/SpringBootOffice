package com.chinasoft.springbootoffice.controller;


import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;

@Controller
public class ErrController implements ErrorController {
    private static final ObjectMapper objectMapper = new ObjectMapper();
    private PrintWriter writer = null;
    /*初始化页面 的配置*/
    @RequestMapping("/")
    public String showIndex(HttpServletRequest request){

        return "admin/login";
    }
/*如果想要访问springBoot的jsp网页 需要先访问后台
* 进入后端再返回前端  应为SpringBoot不直接支持jsp页面的范围
* 间接的推动了前后端分离式的写法*/
/*伪静态 活值路径占位  请求可以重新拼接*/
@RequestMapping("/admin/jsp/{mark}")
public String mark(@PathVariable("mark") String mark,
                   HttpServletRequest request){
    if(mark.equals("out")){
        request.getSession().setAttribute("adminMap", null);
        return "admin/login";
    }
    return  "admin/"+mark;
}



    /*项目错误处理机制*/
    @RequestMapping("/error")
    public String showError(HttpServletRequest request){
        /*注意  springBoot中有异常处理机制 和错误返回码  可以将报错 页面具体细分 */
		/* Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
			        if(statusCode == 401){
			            return "/401";
			        }else if(statusCode == 404){
			            return "/404";
			        }else if(statusCode == 403){
			            return "/403";
			        }else{
			            return "/500";
			        }*/
        return  getErrorPath();
    }


    @Override
    public String getErrorPath() {
        // TODO Auto-generated method stub
        return "error";
    }
}
