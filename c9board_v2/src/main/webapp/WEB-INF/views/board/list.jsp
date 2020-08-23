<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-12 text-center mb-5">
		<h1>Board v2 List</h1>
		<p class="text-muted">Welcome, ${loginUser }</p>
	</div>
</div>

<form id="form-list-condition" method="GET" action="list.jsp">
	<div id="upper-form" class="row">
		<div class="col-4">
			<a href="writeForm.jsp" class="btn btn-secondary ml-3">Write</a>
		</div>
		
		<div class="col-8 d-flex justify-content-end">
			<div class="form-group" onchange="submitConditionForm(1)">
				<select id="select-row-count" class="form-control" name="rowcount">
					<option value="10" >10 rows</option>
					<option value="20" >20 rows</option>
					<option value="50" >50 rows</option>
				</select>
			</div>
			
			<div class="ml-1 form-group" onchange="submitConditionForm(1)">
				<select id="select-writer" class="form-control" name="writertype">
					<option value="">get All</option>
					<option value="My" >get My</option>
				</select>
			</div>
			
			<div style="display:none;">
				<input type="hidden" name="pageno" value="" >
			</div>
		</div>
	</div>
	
	<div id="main-table" class="row">
		<div class="col-12">
			<table class="table">
				<colgroup>
					<col width=10%>
					<col width=*>
					<col width=30%>
					<col width=15%>
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>Title</th>
						<th>Writer</th>
						<th>RegDate</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="5" style="color: crimson">There's No Articles Written Yet.</td>
					</tr>
					<tr style="">
						<td>${board.no }</td>
						<td>
							<a href="detail.jsp?boardno=${board.no }" >
								${board.title }
							</a>
						</td>
						<td>${board.user.nickname }</td>
						<td>${board.createdDate }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	
	<div id="lower-form" class="row">
		<div id="pagenation" class="col-8 pl-5  text-muted">
			<a onclick="movePage(event, 1)" >&laquo;</a>
			<a href="#" onclick="movePage(event, 1)">1</a>
			<a onclick="movePage(event, 1)" >&raquo;</a> 
		</div>
	
		<div class="col-4 d-flex justify-content-end">
			<div class="form-group">
				<input type="text" name="keyword" value=""	placeholder="Find Title Containing Key" />
				<button type="button" onclick="submitConditionForm(1)" class="badge badge-dark">Find</button>
			</div>
		</div>
	</div>
</form>
