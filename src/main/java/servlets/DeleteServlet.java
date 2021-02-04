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

public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        EntityManager entityManager = JpaUtil.getEntityManagerFactory().createEntityManager();
        EmployeeDao employeeDao = new EmployeeDao(entityManager);
        entityManager.getTransaction().begin();
        int id =  Integer.parseInt(req.getParameter("id"));
        try {
            employeeDao.delete(employeeDao.load(id));
            entityManager.getTransaction().commit();
            resp.getWriter().println("deleted successfully!");
            req.getRequestDispatcher("index.jsp").include(req,resp);
        }catch (IllegalArgumentException e){
            resp.getWriter().println("This record doesn't excist!");
            req.getRequestDispatcher("index.jsp").include(req,resp);
        }

    }
}
