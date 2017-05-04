package com.yydhy.treetable;

import java.sql.SQLException;
import java.util.List;

public class TestTreeList {

    /**
     * @param args
     */
    public static void main(String[] args) {
        DepartmentDAO dao = new DepartmentDAO();
        List<Department> list = dao.getDepartments();
        TreeList tree = new TreeList(list);
        List<Department> listTree = tree.buildTree();
        for (Department department : listTree) {
            System.out.println(department.toString());
        }
    }
}
