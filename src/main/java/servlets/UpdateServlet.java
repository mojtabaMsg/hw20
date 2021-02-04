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

public class UpdateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager entityManager = JpaUtil.getEntityManagerFactory().createEntityManager();
        entityManager.getTransaction().begin();
        EmployeeDao employeeDao = new EmployeeDao(entityManager);
        Employee employee = employeeDao.load(Integer.parseInt(req.getParameter("id")));
        String fromAddDetailPage = req.getParameter("fromAddDetailPage");
        if(fromAddDetailPage==null) {
            employee.setFirstName(req.getParameter("fname"));
            employee.setLastName(req.getParameter("lname"));
            employee.setEmail(req.getParameter("email"));
        }
        else{//if the request is  from this page Add these details
            employee.setFatherName(req.getParameter("fatherName"));
            employee.setNationalCode(req.getParameter("nationalCode"));
        }
        employeeDao.update(employee);
        entityManager.getTransaction().commit();

        req.getRequestDispatcher("index.jsp").forward(req,resp);

    }
}
