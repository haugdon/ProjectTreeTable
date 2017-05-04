<%--Ajax调用数据库内容json 实现--%>
<%@page import="com.yydhy.treetable.TreeList" %>
<%@page import="com.yydhy.treetable.DepartmentDAO" %>
<%@page import="com.yydhy.treetable.Department" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>树表控件</title>
    <style type="text/css">
        table, td, th {
            border: 1px solid #8DB9DB;
            padding: 5px;
            border-collapse: collapse;
            font-size: 16px;
        }
    </style>
    <!--此处引入自己的样式表和js文件 官方提供的 jquery.treeTable.js 文件引入jquery.treeTable.css 文件路径有问题
  如果F12 调试找不到该文件 可以直接在页面中引入 写成固定路径
  修改jquery.treeTable.js 这里即可
  window.SITE_URL = window.SITE_URL || '';
  if (document.location.href.indexOf('http://') != 0)	{
          var path = '../js/treeTable/';
  } else {
          var path = SITE_URL + 'js/treeTable/';
  }
    引用的文件 Begin-->
    <link href="css/demo.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/treeTable/jquery.treeTable.js" type="text/javascript"></script>
    <!--引用的文件 End-->
    <script type="text/javascript">
        function ajaxSubmitTest() {
            console.info("正在执行Ajax请求");
            $.ajax({
                type: "post",
                url: "TreeServlet", //Servlet请求地址
                dataType: "json",
                success: function (data) {
                    var con = data.rows;//获取json中的list列表
                    var showContent = "";//添加内容变量
                    for (var i = 0, l = con.length; i < l; i++) {
                        var a = con[i];
                        if (a.parentid == null) { //判断是否是一级节点
                            showContent += "<tr id='" + a.depart_id + "'>";
                            showContent += "<td><span controller='true'>" + a.depart_name + "</span></td>";
                            showContent += "<td>" + a.depart_name + "</td>";
                            showContent += "<td>" + a.depart_id + "</td>";
                            showContent += "</tr>";
                        } else {
                            showContent += "<tr id='" + a.depart_id + "' pid='" + a.parentid + "'>";
                            showContent += "<td>" + a.depart_name + "</td>";
                            showContent += "<td>" + a.depart_name + "</td>";
                            showContent += "<td>" + a.depart_id + "</td>";
                            showContent += "</tr>";
                        }
                    }
                    $("#treeTable1").append(showContent);
                    //以下为初始化表格样式
                    var option = {
                        theme: 'vsStyle',
                        expandLevel: 2,//树表的展开层次. 默认:1
                    };
                    $('#treeTable1').treeTable(option);
                    console.info("内容已经加载并初始化");
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(errorThrown);
                    console.info("数据请求异常 请查看控制台错误 或者检查servlet配置")
                }
            });
        }
        $(function () {
            ajaxSubmitTest(); //调用ajax初始化内容
        });
    </script>
</head>
<body>
<div id="page">
    <fieldset>
        <legend>演示</legend>
        <table id="treeTable1" style="width:100%">
            <tr>
                <td style="width:200px;">标题</td>
                <td>内容一</td>
                <td>内容二</td>
            </tr>
        </table>
    </fieldset>
</div>
</body>
</html>