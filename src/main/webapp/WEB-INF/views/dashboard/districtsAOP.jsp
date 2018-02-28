<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<c:url value="/admin/districts/create" var="createDistrict" />
<html>
	<jsp:include page="../fragments/header.jsp" />
	<!-- page content -->
	<div class="right_col" role="main">
		<div class="">
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="x_panel">
						<div class="x_title">
							<h2>Districts</h2>
							<ul class="nav navbar-right panel_toolbox">
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
									<ul class="dropdown-menu" role="menu">
										<li>
											<a href="${createDistrict}">Add District</a>
										</li>
									</ul>
								</li>
							</ul>
							<div class="clearfix"></div>
						</div>
						<div class="x_content">
<!-- 							<p class="text-muted font-13 m-b-30"> -->
<%-- 								DataTables has most features enabled by default, so all you need to do to use it with your own tables is to call the construction function: <code>$().DataTable();</code> --%>
<!-- 							</p> -->
							<table id="datatable" class="table table-striped table-bordered">
								<thead>
									<tr>
										<th>Name</th>
										<th>BEDS Code</th>
										<c:if test="${showNumberOfOrders eq true}">
											<th>Number of Orders</th>
										</c:if>
										<sec:authorize access="hasRole('ADMIN') or hasRole('DBA')">
											<th>Management</th>
										</sec:authorize>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${districtsOrder}" var="districtOrder">
										<tr>
											<td><a href="<c:url value='/admin/districts/${districtOrder.district.uuid}' />">${districtOrder.district.name}</a></td>
											<td>${districtOrder.district.bedsCode}</td>
											<c:if test="${showNumberOfOrders eq true}">
												<td>${districtOrder.orderCount}</td>
											</c:if>
										    <sec:authorize access="hasRole('ADMIN')">
												<td width="195px">
													<a href="<c:url value='/admin/districts/${districtOrder.district.uuid}/edit' />" class="btn btn-success custom-width" data-toggle="tooltip" data-placement="top" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
													<a type="button" class="btn btn-danger custom-width" data-toggle="modal" data-target=".modal-sm-${istrictOrder.district.uuid}"><i class="fa fa-trash"></i></a>
													<!-- Visible -->
													<c:choose>
														<c:when test="${districtOrder.district.visible == true}">
															<a href="<c:url value='/admin/districts/${districtOrder.district.uuid}/hide/false' />" class="btn btn-default custom-width" data-toggle="tooltip" data-placement="top" data-original-title="Visible"><i class="fa fa-eye"></i></a>
														</c:when>
														<c:otherwise>
															<a href="<c:url value='/admin/districts/${districtOrder.district.uuid}/hide/true' />" class="btn btn-default custom-width" data-toggle="tooltip" data-placement="top" data-original-title="Hidden"><i class="fa fa-eye-slash"></i></a>
														</c:otherwise>
													</c:choose>
													<!-- Lock -->
													<c:choose>
														<c:when test="${districtOrder.district.locked == true}">
															<a href="<c:url value='/admin/districts/${districtOrder.district.uuid}/lock/false' />" class="btn btn-dark custom-width" data-toggle="tooltip" data-placement="top" data-original-title="Locked"><i class="fa fa-lock"></i></a>
														</c:when>
														<c:otherwise>
															<a href="<c:url value='/admin/districts/${districtOrder.district.uuid}/lock/true' />" class="btn btn-dark custom-width" data-toggle="tooltip" data-placement="top" data-original-title="Unlocked"><i class="fa fa-unlock"></i></a>
														</c:otherwise>
													</c:choose>
												</td>
					        				</sec:authorize>
										</tr>
									</c:forEach>									
								</tbody>
							</table>
							<!-- Start Delete Popup Confirmation -->
							<sec:authorize access="hasRole('ADMIN')">
								<c:forEach items="${districtsOrder}" var="districtOrder">
									<div class="modal fade modal-sm-${districtOrder.district.uuid}" tabindex="-1" role="dialog" aria-hidden="true">
										<div class="modal-dialog modal-sm">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">?</span>
													</button>
													<h4 class="modal-title" id="myModalLabel2">Confirmation</h4>
												</div>
												<div class="modal-body">
													<h5>Delete District: </h5>
													<p>${districtOrder.district.name}</p>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
													<a href="<c:url value='/admin/districts/${districtOrder.district.uuid}/delete' />" class="btn btn-danger">Delete</a>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</sec:authorize>
							<!-- End Delete Popup Confirmation -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../fragments/footer.jsp" />
</html>