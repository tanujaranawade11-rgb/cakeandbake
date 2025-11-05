
<%@page import="com.pojo.CategoryPojo"%>
<%@page import="java.util.List"%>
<%@page import="com.daoimpl.CategoryDaoimpl"%>
<%
CategoryDaoimpl categoryDaoimpl=new CategoryDaoimpl();
List<CategoryPojo> lcp=categoryDaoimpl.getAllCategory();
%>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Cake</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="AddCake_servlet" method="post" enctype="multipart/form-data">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Name</label>
    <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Price</label>
    <input type="number" name="price" class="form-control" id="exampleInputPassword1">
  </div>
<div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">discount</label>
    <input type="number" name="discount" class="form-control" id="exampleInputPassword1">
  </div>
  
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Fprice</label>
    <input type="number" name="fprice" class="form-control" id="exampleInputPassword1">
  </div>
  <div class="mb-3">
      <label for="disabledSelect" class="form-label">Category</label>
      <select id="disabledSelect" class="form-select" name="category">
      <%for(CategoryPojo c:lcp){ %>
        <option value="disable"><%=c.getName() %></option>
        <%} %>
      </select>
    </div>
    <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Description</label>
    <textarea rows="" cols="" class="form-control" name="description"></textarea>
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Image</label>
    <input type="file" class="form-control" name="image" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
    
 
  <button type="submit" class="btn btn-primary btn-block">Add</button>
</form>
      </div>
      
      
    </div>
  </div>
</div>











<!-- Modal -->
<div class="modal fade" id="categoryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="AddCategory_servlet" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Name</label>
    <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  
    <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Description</label>
    <textarea rows="" cols="" class="form-control" name="desc"></textarea>
  </div>
 
    
 
  <button type="submit" class="btn btn-primary btn-block">Add</button>
</form>
      </div>
      
    </div>
  </div>
</div>