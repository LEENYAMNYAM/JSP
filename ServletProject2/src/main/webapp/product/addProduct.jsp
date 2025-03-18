<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="../includes/header.jsp" %>

<div class="container mt-5">
	<H2> Add Product </H2>
	<form action="pInsert.do" method="post" name="frm" enctype="multipart/form-data">  
	<!-- 파일 업로드 시에는 post 방식으로 해야하며, enctype="multipart/form-data" 꼭 써줘야함. -->
	    <div class="mb-3 mt-3">
	      <label for="name">Name:</label>
	      <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
	    </div>
	     
	    <div class="mb-3">
	      <label for="unitPrice">unitPrice:</label>
	      <input type="text" class="form-control" id="unitPrice" placeholder="Enter unitPrice" name="unitPrice">
	    </div> 
	     
	    <div class="mb-3">
	      <label for="description">description:</label>
	      <input type="text" class="form-control" id="description" placeholder="Enter description" name="description">
	    </div>

	    <div class="mb-3">
	      <label for="ofile">file:</label>
	      <input type="file" class="form-control" id="ofile" placeholder="Enter file" name="ofile">
	    </div>

	    <div class="mt-3">
	    	<button type="submit" class="btn btn-primary">상품추가</button>
	    </div>	
	  </form>

</div>
</body>
</html>