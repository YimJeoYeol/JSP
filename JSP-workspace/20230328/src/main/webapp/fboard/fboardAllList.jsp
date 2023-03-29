<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, dto.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 게시판 목록</title>
<style>
	table, tr, td, th {
		border : 2px solid black;
		border-collapse: collapse;
		padding : 3px;
		text-align: center;
	}
</style>
<script type="text/javascript">
	function deleteCheck(id) {
		if(confirm("정말로 삭제하시겠습니까?")){
			location.href = "delete?id="+id+"";
		}
	}
</script>
</head>
<body>
	<h1>전체 게시판 목록</h1>
	<a href="add">글쓰기</a>
	<hr>
	<table>
		<tr><th> 번호 </th><th>제목</th><th> 등록자 </th><th> 날짜 </th><th> 조회 </th><th colspan="2">수정/삭제</th></tr>
<%
	ArrayList<FBoard> FBoardList = (ArrayList<FBoard>) request.getAttribute("FBoardList");
	for(FBoard tmp : FBoardList){ 
	%>
<!-- body -->
	<tr><td><%= tmp.getId() %></td>
		<td><a href="update?id=<%=tmp.getId()%>"><%= tmp.getSubject()%></a></td>
		<td><%= tmp.getName() %></td>
		<td><%= tmp.getInputdate()%></td>
		<td><%= tmp.getReadcount()%></td>
		<td colspan="2">
		<button type="button" onclick="location.href='update?id=<%=tmp.getId()%>'">수정하기</button>
		<button type="button" onclick="deleteCheck(<%=tmp.getId()%>)">삭제하기</button>
		</td>	
	</tr>
<!-- body -->
<% } //for문의 끝.
%>
</table>

	<form action="">
		<select name="stype">
			<option value="1">이름
			<option value="2">제목
			<option value="3">내용
			<option value="4">이름+제목
			<option value="5">이름+내용
			<option value="6">제목+내용
			<option value="7">이름+제목+내용
		</select>
		<input type="text" name="sval">
		<input type="submit" value="검색">
	
	</form>
</body>
</html>