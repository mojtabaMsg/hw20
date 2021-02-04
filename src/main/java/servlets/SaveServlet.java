package servlets;

import Dao.EmployeeDao;
import entities.Employee;
import util.JpaUtil;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SaveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager entityManager = JpaUtil.getEntityManagerFactory().createEntityManager();
        EmployeeDao employeeDao = new EmployeeDao(entityManager);
        entityManager.getTransaction().begin();

        Employee employee = new Employee(request.getParameter("fname"),request.getParameter("lname"),request.getParameter("email"));
        employeeDao.save(employee);

        entityManager.getTransaction().commit();


        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
