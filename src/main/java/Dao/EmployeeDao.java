package Dao;

import entities.Employee;

import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

public class EmployeeDao extends AbstractDao<Employee,Integer> {
    public EmployeeDao(EntityManager entityManager) {
        super(entityManager);
    }

    @Override
    public Class<Employee> getEntityClass() {
        return Employee.class;
    }


    public  boolean userCheckingInDb(String username, String password){

        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Employee> cq = cb.createQuery(Employee.class);
        Root<Employee> fromUser = cq.from(Employee.class);

        cq.select(fromUser).where(cb.and(cb.equal(fromUser.get("username"),username),cb.equal(fromUser.get("password"),password)));

        List<Employee> resultList = entityManager.createQuery(cq).getResultList();
        if (!(resultList.isEmpty()))
            return true;
        else
            return false;
    }

    public List<Employee> showAllEmployees() {

        CriteriaBuilder cb = entityManager.getCriteriaBuilder();
        CriteriaQuery<Employee> cq = cb.createQuery(Employee.class);
        Root<Employee> fromEmployee = cq.from(Employee.class);

        cq.select(fromEmployee);

        List<Employee> resultList = entityManager.createQuery(cq).getResultList();
        return resultList;
    }


}
