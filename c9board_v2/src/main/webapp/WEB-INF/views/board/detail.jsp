<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-12 text-center mb-5">
		<h1>Board v1 Detail</h1>
	</div>
</div>

<div class="row">
	<div class="col-12">
		<table class="table boards">
			<colgroup>
				<col width=20%>
				<col width=*>
				<col width=20%>
				<col width=20%>
			</colgroup>
			<tr>
				<th>Writer</th>
				<td></td>
				<th>RegDate</th>
				<td></td>
			</tr>
			<tr>
				<th>Title</th>
				<td colspan="3"></td>
			</tr>
			<tr>
				<th colspan="4">Content</th>
			</tr>
			<tr style="border-bottom: 1px solid lightgray;">
				<td colspan="4" style="height: 150px; padding: 24px;"></td>
			</tr>
			<tr>
				<td colspan="3">
					<a href="list.jsp" class="badge badge-secondary">To List</a> 
				</td>
				<td colspan="1" class="text-right">
					<a href="modForm.jsp?boardno=" class="badge badge-secondary">Mod</a> 
					<a href="delboard.jsp?boardno=" class="badge badge-danger">Del</a>
				</td>
			</tr>
		</table>
	</div>
</div>
