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

			<input type="button" value="Add Customer" class="btn btn-danger"
				id="add-button" data-toggle="modal" data-target="#myModal" action="showFormForAdd"/>


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
							<form:form action="saveCustomer" modelAttribute="customer"
								method="POST" path="id">
								<!--  need to assocoate this data with customer id -->
								<form:hidden path="id"/>
								<table>
									<tbody>
										<tr>
											<td><label>First name:</label></td>
											<td><form:input path="firstName" /></td>
										</tr>

										<tr>
											<td><label>Last name:</label></td>
											<td><form:input path="lastName" /></td>
										</tr>

										<tr>
											<td><label>Email:</label></td>
											<td><form:input path="email" /></td>
										</tr>

										<tr>
											<td><label></label></td>
											<td><input type="submit" value="Save" class="save" /></td>
										</tr>


									</tbody>
								</table>


							</form:form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Submit</button>
							<td><input type="submit" value="Save" class="save" />Saving</td>
						</div>
					</div>

				</div>
			</div>



			<table class="table table-striped">
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>

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









