<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    request.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">


</head>
<body>

<div >
    <input id="file" type="file" name="file"/><br>
    <%--<button id="upload" type="button" οnclick="fileUpload();">上传</button>--%>
    <input id="upload"  type="button"  onclick="fileUpload();" value="上传"/>
</div>

<br><br>
<button id="button0">预览</button>
<br><br><br>
<input   type="button"  onclick="downloadFile();" value="点击下载此文件"/>
</body>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<script type="text/javascript">
    var firstFileName="";
    var lastFileName="";
function downloadFile(){
    $(function () {
if(firstFileName==""){
alert('抱歉，暂未上传文件，无法下载');
}else{
    window.open("admin/download.action?fileName="+firstFileName+"."+lastFileName);
}


    });
}

    function fileUpload(){
        $(function(){
           var formData=new FormData();
           if($('#file')[0].files[0]+''=='undefined'){
                alert('未选择文件，无法进行上传');
           }else{
               formData.append('file',$('#file')[0].files[0]);
               $.ajax({
                   type:'POST',
                   url:'admin/fileUpload',
                   data:formData,
                   cache:false,
                   contentType: false,
                   processData: false,
                   success:function(data){
                       if(data.mark+''=='1'){
                           firstFileName=data.firstFileName+'';
                           lastFileName=data.lastFileName+'';
                           alert('上传成功Q!!');
                       }else{
                           alert('上传失败');
                       }
                   },error:function () {
                       alert('上传失败');
                   }

               })
           }

        });
    }

</script>
<script type="text/javascript">

    $('#button0').click(function() {
        if(firstFileName==''){
        alert('没有成功上传文件，本网页无法预览');
        }else{
            window.open("http://localhost:8088/pdfJs/web/viewer.html?file=http://localhost:8088/toPdfFile/"+firstFileName+"/"+lastFileName);
        }

    });
</script>
</html>