<%@ page import="entities.Employee" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/styles.css">


</head>
<body>
<div class="text-center">
    <a href="#myModal" class="trigger-btn btn btn-primary btn-lg active" data-toggle="modal" role="button" aria-pressed="true">Click to Add New Employee</a>
</div>
<div class="text-center">
    <a href="#myModalUpdate" class="trigger-btn btn btn-primary btn-lg active" data-toggle="modal" role="button" aria-pressed="true">Click to Edit an Employee</a>
</div>
<div class="text-center">
    <a href="#myModalDelete" class="trigger-btn btn btn-primary btn-lg active" data-toggle="modal" role="button" aria-pressed="true">Click to Delete an Employee</a>
</div>
<div class="text-center">
    <a href="#myModalAddDetials" class="trigger-btn btn btn-primary btn-lg active" data-toggle="modal" role="button" aria-pressed="true">Click to Add Detials to Employee</a>
</div>


<div id="myModal" class="modal fade">
    <div class="modal-dialog modal-login">
        <div class="modal-content">
            <div class="modal-header">
                <div class="avatar">

                </div>
                <h4 class="modal-title">Employee Registering</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="saveServlet" method="get">
                    <div class="form-group">
                        <input type="text" class="form-control" name="fname" placeholder="Frist Name" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="lname" placeholder="Last Name" required="required">
                    </div>
                    <div class="form-group" >
                        <input type="text" class="form-control" name="email" placeholder="Email" required="required">
                    </div>

                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-lg btn-block login-btn">register</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<%--the form for delete an employee--%>
<div id="myModalDelete" class="modal fade">
    <div class="modal-dialog modal-login">
        <div class="modal-content">
            <div class="modal-header">
                <div class="avatar">

                </div>
                <h4 class="modal-title">Employee Deleting</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="deleteServlet" method="get">
                    <div class="form-group">
                        <input type="text" class="form-control" name="id" placeholder="Enter ID of the Employee"
                               required="required">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-lg btn-block login-btn">delete</button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<div id="myModalUpdate" class="modal fade">
    <div class="modal-dialog modal-login">
        <div class="modal-content">
            <div class="modal-header">
                <div class="avatar">

                </div>
                <h4 class="modal-title">Employee Updating</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="findEmployeeServlet" method="get">
                    <div class="form-group">
                        <input type="text" class="form-control" name="id" placeholder="Enter ID of the Employee" required="required">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-lg btn-block login-btn">search to update
                        </button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<%--the form for adding Details--%>
<div id="myModalAddDetials" class="modal fade">
    <div class="modal-dialog modal-login">
        <div class="modal-content">
            <div class="modal-header">
                <div class="avatar">

                </div>
                <h4 class="modal-title">Employee Adding Details</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <form action="findEmployeeServlet" method="get">
                    <%--                    <input type="text" name="fromAddingDetialsFLAG" value="toAdd" style="visibility: hidden">--%>
                    <div class="form-group">
                        <input type="text" class="form-control" name="fromAddingDetialsFLAG" value="toAdd"
                               style="visibility: hidden" placeholder="Enter ID of the Employee" required="required">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" name="id" placeholder="Enter ID of the Employee"
                               required="required">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-lg btn-block login-btn">search to Adding details</button>
                        </button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>
<% if (request.getAttribute("employeeForUpdate") != null) {
    Employee employee = (Employee) request.getAttribute("employeeForUpdate");%>
<form action="updateServlet" method="get">
    <div class="form-group">
        <input type="text" class="form-control" name="id" value="<%=employee.getId()%>" style="visibility: hidden;">
    </div>
    <div class="form-group">
        <input type="text" class="form-control" name="fname" placeholder="Frist Name"
               value="<%=employee.getFirstName()%>" required="required">
    </div>
    <div class="form-group">
        <input id="idInput" type="text" class="form-control" name="lname" placeholder="Last Name"
               value="<%=employee.getLastName()%>" required="required">
    </div>
    <div class="form-group">
        <input id="fnameInput" type="text" class="form-control" name="email" placeholder="Email"
               value="<%=employee.getEmail()%>" required="required">
    </div>
    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-lg btn-block login-btn">Update</button>
    </div>
    <% } %>
</form>


<a class="btn btn-primary btn-lg btn-block login-btn" href="viewServlet">show all employees</a>


<% if(request.getAttribute("employees")!=null){
    List<Employee> employeeList = (List<Employee>) request.getAttribute("employees");%>
<table class="table table-bordered">
    <thead class="thead-dark">
    <tr id="clickable">
        <td align="center" style="font-weight: bold" scope="col">ID</td>
        <td align="center" style="font-weight: bold" scope="col">FirstName</td>
        <td align="center" style="font-weight: bold" scope="col">LastName</td>
        <td align="center" style="font-weight: bold" scope="col">Email</td>
        <td align="center" style="font-weight: bold" scope="col">National Code</td>
        <td align="center" style="font-weight: bold" scope="col">Father Name</td>
    </tr>
<% for (Employee employee : employeeList){%>
    <tr >

        <td  style="font-weight: bold" align="center"> <a> <%=employee.getId()%> </a></td>
        <td  align="center"><%=employee.getFirstName()%></td>
        <td  align="center"><%=employee.getLastName()%></td>
        <td  align="center"><%=employee.getEmail()%></td>
        <td  align="center"><%=employee.getNationalCode()%></td>
        <td  align="center"><%=employee.getFatherName()%></td>

    </tr>
    <%}
}%>
</body>
</html>
