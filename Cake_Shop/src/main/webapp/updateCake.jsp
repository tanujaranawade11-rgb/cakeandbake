<%@page import="com.pojo.CakePojo"%>
<%@page import="com.daoimpl.CakeDaoimpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Cake</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">

</head>
<body>
<%
int cid=Integer.parseInt(request .getParameter("cid"));
CakeDaoimpl cakeDaoimpl=new CakeDaoimpl();
CakePojo cakePojo=cakeDaoimpl.getCakeById(cid);
%>
<div class="container">
<div class="row">
<div class="col-md-6 mx-auto mt-5">
<div class="card">
<div class="card-body">
<form action="UpdateCake_servlet?cid=<%=cid %>" method="post" enctype="multipart/form-data">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Name</label>
    <input type="text" name="name" value="<%=cakePojo.getName() %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Price</label>
    <input type="number" name="price" value=<%=cakePojo.getPrice() %> class="form-control" id="exampleInputPassword1">
  </div>
<div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">discount</label>
    <input type="number" name="discount" value=<%=cakePojo.getDiscount() %> class="form-control" id="exampleInputPassword1">
  </div>
  
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Fprice</label>
    <input type="number" name="fprice" value=<%=cakePojo.getFprice() %> class="form-control" id="exampleInputPassword1">
  </div>
  <div class="mb-3">
      <label for="disabledSelect" class="form-label">Category</label>
      <select id="disabledSelect" class="form-select" name="category">
        <option value="disable">Disabled select</option>
      </select>
    </div>
    <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Description</label>
    <textarea rows="" cols=""  class="form-control" name="description"><%=cakePojo.getDescription() %></textarea>
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Image</label>
    <input type="file" required="required" class="form-control" value="<%=cakePojo.getImage() %>" name="image" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
    
 
  <button type="submit" class="btn btn-primary btn-block">Update</button>
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>