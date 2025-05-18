<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="hero__slider owl-carousel">
                  <%
       									  Connection cn1= new DBUtil().getConnection();
       									  String qry1="select * from newanime";
       									  PreparedStatement st1=cn1.prepareStatement(qry1);
       									  ResultSet rs1=st1.executeQuery();
       									  while(rs1.next())
       									  {
       								%> 
                <div class="hero__items set-bg" data-setbg="anime-images/<%= rs1.getString("image") %>">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="hero__text">
                                
                                <h2><%= rs1.getString("animename") %></h2>
                               
                                <a href="Anime-Details.jsp?animeid=<%=rs1.getInt(1)%>"><span><%= rs1.getString("animename") %></span> <i class="fa fa-angle-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                     <%
       									  }
       									  cn1.close();	
                                  %>
			 </div>
        </div>
    </section>
    <!-- Hero Section End -->
</body>
</html>