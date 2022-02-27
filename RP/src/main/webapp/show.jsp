<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="project.ProjectDAO" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="project.Project" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<!doctype html>
<html>
<head>
	<title>  Recommend Project Subject </title>
 
	<meta charset ="utf-8">

	<link rel="stylesheet" href ="css/show.css">
 
 	<script src = ""></script>   
	
	<link href="https://fonts.googleapis.com/css?family=Bowlby+One+SC&display=swap&subset=latin-ext" rel="stylesheet">
    <link href = "https://fonts.google.com/noto/specimen/Noto+Serif+Display" rel = "stylesheet" type = 'text/css'>
</head>
<body>
    <div class="header">
        Recommend Project 
    </div>
    <div class="container">
		<div class="row">
			<table class="table table-triped" style="text-align: center; border: 1ps solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;"> 제목 </th>
						<th style="background-color: #eeeeee; text-align: center;"> 키워드1 </th>
						<th style="background-color: #eeeeee; text-align: center;"> 키워드2 </th>
					</tr>
				</thead>
				<tbody>
					<%
						String[] category = request.getParameterValues("chk");
						ProjectDAO projectDAO = new ProjectDAO();
						ArrayList<Project> list = new ArrayList<>();
						if (Arrays.asList(category).contains("app")) { // app 있음
							if(Arrays.asList(category).contains("web")){
								list = projectDAO.get_Web_App_CheckedProjectList();
							}
							else if(Arrays.asList(category).contains("ai")){
								list = projectDAO.get_App_AI_CheckedProjectList();
							}
							else{
								list = projectDAO.getAppCheckedProjectList();
							}
						}
						else{ //app 없음
							if(Arrays.asList(category).contains("web")){ 
								if(Arrays.asList(category).contains("ai")){
									list = projectDAO.get_Web_AI_CheckedProjectList();
								}
								else{
									list = projectDAO.getWebCheckedProjectList();
								}
							}
							else{
								list = projectDAO.getAICheckedProjectList();
							}
						}
						
						
						for (int i=0 ; i<list.size() ; i++) {
					%>
					<tr>
						<td><%= list.get(i).getProjectName() %></td>
						<td><%= list.get(i).getProjectKeyword1() %></td>
						<td><%= list.get(i).getProjectKeyword2() %></td>
					</tr>
					<%	
						}
					%>
				</tbody>
			</table>
		
		</div>
	</div>
    <div class="footer"></div>
</body>
</html>