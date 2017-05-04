package com.yydhy.treetable;

import com.alibaba.fastjson.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//Java后台打包json数据库
public class TreeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        Map<String, Object> map = new HashMap<String, Object>();
        DepartmentDAO dao = new DepartmentDAO();
        List<Department> list = dao.getDepartments();
        TreeList tree = new TreeList(list);
        List<Department> listTree = tree.buildTree();
        map.put("rows", listTree);
        map.put("total", listTree.size());
        String str = JSONObject.toJSONString(map);
        response.getWriter().write(str);
    }
}
