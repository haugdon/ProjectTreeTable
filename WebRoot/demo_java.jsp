<%--treeTable jsp Java代码 实现--%>
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
      引用的文件 Begin-->
    <link href="css/demo.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script src="js/treeTable/jquery.treeTable.js" type="text/javascript"></script>
    <!--引用的文件 End-->
    <script type="text/javascript">
        //初始化表格样式和树形结构
        $(function () {
            var option1 = {
                theme: 'vsStyle',//主题，有两个选项：default、vsStyle(三角形式). 默认:default(加减号那种形式)
                expandLevel: 2,//展开二级分类
            };
            $('#treeTable1').treeTable(option1);//根据表格id来初始化
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
            <!--数据库加载内容开始-->
            <!--可以通过el表达式直接调用  也可以通过Java代码调用 后台已经将数据格式化为td tr 格式 直接输出就可以了-->
            <!--如果使用ajax也可以 只需要在后台请求地址中打包成json格式返回 在回调函数中 然后根据表格ID 往表格里面添加json内容即可-->
            <%
                DepartmentDAO dao = new DepartmentDAO();//创建数据库查询对象
                List<Department> list = dao.getDepartments();//查询数据库返回list集合
                TreeList tree = new TreeList(list);//创建树形对象
                List<Department> list2 = tree.buildTree();//通过递归方法获取树形排序结果
                for (Department d : list2) {
                    if (d.getParentid() != null) {
            %>
            <tr id='<%=d.getDepart_id() %>' pid='<%=d.getParentid()%>'>
                <td><%=d.getDepart_name()%>
                </td>
                <td><%=d.getDepart_name()%>
                </td>
                <td><%=d.getDepart_id()%>
                </td>
            </tr>
            <%
            } else {
            %>
            <tr id='<%=d.getDepart_id() %>'>
                <td><%=d.getDepart_name()%>
                </td>
                <td><span controller='true'><%=d.getDepart_name()%></span></td>
                <td><%=d.getDepart_id()%>
                </td>
            </tr>
            <%
                    }
                }
            %>

            <!--数据库加载内容结束-->
        </table>

    </fieldset>
</div>
</body>
</html>
