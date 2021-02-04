<%@ page import="entities.Employee" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2/3/2021
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Details Adding</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

                <h4 class="modal-title">Adding Details</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
                <% Employee employee = (Employee) request.getAttribute("employeeForUpdate");%>
            <div>ID : <%=employee.getId()%></div>
                <div>First Name: <%=employee.getFirstName()%></div>
                <div>Last Name:<%=employee.getLastName()%></div>
                <form action="updateServlet" method="get">

                    <div class="form-group">
                        <input type="text" class="form-control" name="fromAddDetailPage" value="toAdd" style="visibility: hidden;" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="id" value="<%=employee.getId()%>" style="visibility: hidden;" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="fatherName" placeholder="Father Name" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="nationalCode" placeholder="National Code" required="required">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-lg btn-block login-btn">Enter</button>
                    </div>
                </form>


        </div>
    </div>

</body>
</html>
