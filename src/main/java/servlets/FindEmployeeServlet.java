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

public class FindEmployeeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        EntityManager entityManager = JpaUtil.getEntityManagerFactory().createEntityManager();
        EmployeeDao employeeDao = new EmployeeDao(entityManager);
        try {
            Employee employee = employeeDao.load(Integer.parseInt(req.getParameter("id")));
            req.setAttribute("employeeForUpdate", employee);
            String flag = req.getParameter("fromAddingDetialsFLAG");
            if ((flag==null)) {
                req.getRequestDispatcher("index.jsp").include(req, resp);
            } else {
                req.getRequestDispatcher("addDetails.jsp").include(req, resp);
            }
        } catch (IllegalArgumentException e){
                resp.getWriter().println("This record doesn't excist!");
                req.getRequestDispatcher("index.jsp").include(req,resp);
            }finally {
            entityManager.close();
        }
        }
    }
