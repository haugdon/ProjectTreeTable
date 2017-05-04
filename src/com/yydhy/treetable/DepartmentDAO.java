/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.yydhy.treetable;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DepartmentDAO {

    private static Connection conn;
    private PreparedStatement pstat;

    /**
     * 查询数据库部门表信息
     * @return 
     */
    public List<Department> getDepartments() {
        try {
            conn = DBUtil.getConnection();
        } catch (SQLException ex) {
            System.out.println("com.yydhy.treetable.DepartmentDAO.getDepartments()"+"数据库连接异常");
        }
        List<Department> list = new ArrayList<Department>();
        try {
            String sql = "select * from department_info";
            pstat = conn.prepareStatement(sql);
            ResultSet rs = pstat.executeQuery();
            while (rs.next()) {
                Department d = new Department();
                d.setDepart_id(rs.getString("depart_id"));
                d.setParentid(rs.getString("parentid"));
                d.setDepart_name(rs.getString("depart_name"));
                d.setDepart_type(rs.getInt("depart_type"));
                d.setDepart_order(rs.getInt("depart_order"));
                d.setStatus(rs.getInt("status"));
                d.setAddress(rs.getString("address"));
                d.setDepart_phone(rs.getString("depart_phone"));
                d.setOrgan_id(rs.getString("organ_id"));
                Date del_time = rs.getDate("del_time");
                Date create_time = rs.getDate("create_time");
                d.setDel_time(del_time);
                d.setCreate_time(create_time);
                list.add(d);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
