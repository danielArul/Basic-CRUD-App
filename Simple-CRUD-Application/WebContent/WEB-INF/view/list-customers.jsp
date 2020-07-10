<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>

<html>

<head>
<title>List Customers</title>

<!-- reference our style sheet -->
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>A Simple CRUD Application</h2>
		</div>
	</div>

	<div id="container">

		<div id="content">

			<!--  add our html table here -->
		
		<table class="table" id="item1">
			<tr>
				<td>
				<input type="button" value="Add Customer" class="btn btn-danger"
				id="add-button" data-toggle="modal" data-target="#myModal" />
				</td>
				
				<td class="right">
				
				<form:form action="search" method="GET">
				Search customer: <input type="text" name="theSearchName" />

				<input class="btn btn-danger" type="submit" value="Search" class="add-button" />
				</form:form>
								
				</td>
			</tr>
		</table>
		


			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Add Customer</h4>
						</div>
						<div class="modal-body">

							<form action="saveCustomer" modelAttribute="customer"
								method="POST" path="id">


								<div class="form-group">
									<label for="firstName">First Name:</label> <input
										id="firstName" class="form-control"
										placeholder="Enter First Name" name="firstName">
								</div>

								<div class="form-group">
									<label for="lastName">Last Name:</label> <input id="lastName"
										class="form-control" placeholder="Enter Last Name"
										name="lastName">
								</div>

								<div class="form-group">
									<label for="email">E-Mail:</label> <input type="email"
										class="form-control" placeholder="Enter email" class="email"
										id="email" name="email">
								</div>

								<button type="submit" class="btn btn-default">Submit</button>
							</form>
						</div>

					</div>

				</div>
			</div>

			<table id="mainTable" class="table table-striped">
			<thead>
				<tr>
					<th class="text-center">First Name</th>
					<th class="text-center">Last Name</th>
					<th class="text-center">Email</th>
					<th class="text-center">Action</th>
				</tr>
			</thead>
			

				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${customers}">

					<!-- constructor 'update' link with customers id -->
					<c:url var="updateLink" value="/customer/showFormForUpdate">

						<c:param name="customerId" value="${tempCustomer.id}" />

					</c:url>

					<!-- constructor 'update' link with customers id -->
					<c:url var="deleteLink" value="/customer/delete">

						<c:param name="customerId" value="${tempCustomer.id}" />

					</c:url>
					
					

					<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>
						<td><a id="update-button" href="${updateLink}">Update</a> <a>|</a>
							<a id="delete-button" href="${deleteLink}"
							onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>

						</td>

					</tr>
					

				</c:forEach>

			</table>

		</div>

	</div>


</body>

</html>









