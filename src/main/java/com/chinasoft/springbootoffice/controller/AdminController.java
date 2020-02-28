package com.chinasoft.springbootoffice.controller;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.UUID;
import com.chinasoft.springbootoffice.service.AdminService;
import com.chinasoft.springbootoffice.util.RequestUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService  adminService;

    @RequestMapping("/download")
    @ResponseBody
    public String download(HttpServletResponse response, @RequestParam("fileName") String fileName){
         File file = new File
                 (System.getProperty("user.dir") + "/src/main/resources/upload/"+ fileName);
        if(!file.exists()){
            return "下载文件不存在";
        }
        response.reset();
        response.setContentType("application/octet-stream");
        response.setCharacterEncoding("utf-8");
        response.setContentLength((int) file.length());
        response.setHeader("Content-Disposition", "attachment;filename="+fileName );

        try(BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));) {
            byte[] buff = new byte[1024];
            OutputStream os  = response.getOutputStream();
            int i = 0;
            while ((i = bis.read(buff)) != -1) {
                os.write(buff, 0, i);
                os.flush();
            }
        } catch ( Exception e) {
           //log.error("{}",e);
            return "下载失败";
        }
        return "下载成功";
    }



    @RequestMapping(value="fileUpload",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,String> fileUpload(MultipartFile file,HttpServletRequest request){
   Map<String,String> map=new HashMap<String,String>();
        if(file.isEmpty()){
            map.put("mark","0");
            return map;
        }
        String fileName = UUID.randomUUID().toString()
                .replace("-", "")+"."
                +file.getOriginalFilename()
                .substring(file.getOriginalFilename()
                        .lastIndexOf(".")+1)
                .toString();

        String path = System.getProperty("user.dir") + "/src/main/resources/upload" ;
        File dest = new File(path + "/" + fileName);
        if(!dest.getParentFile().exists()){ //判断文件父目录是否存在
            dest.getParentFile().mkdir();
        }
        try {
            file.transferTo(dest); //保存文件
            map.put("mark","1");
         //   request.getSession().setAttribute("fileName",fileName);

           map.put("firstFileName",fileName.substring(0,fileName.lastIndexOf(".")));
            map.put("lastFileName",fileName.substring(fileName.lastIndexOf(".")+1));
            return map;
        } catch ( Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            map.put("mark","0");
            return map;
        }
    }


    @RequestMapping("/login")
    /* @ResponseBody */
    public String  login(HttpServletRequest request){
   List<Map<String,Object>> list=
           adminService.selectUsers(RequestUtil.getQueryMap(request));
Map<String,Object> map=new HashMap<String,Object>();
if(list.size()>0){
request.setAttribute("map",list.get(0));
}else{
    map.put("name","抱歉，查无此数据");
    request.setAttribute("map",map);
}
return  "admin/index";
    }


}
