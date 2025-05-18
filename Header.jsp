<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="./Index.jsp">
                            <img src="img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                           <ul>
   								 <li class="active"><a href="./Index.jsp">Homepage</a></li>
   								 <li><a href="./Blog.jsp">Blog</a></li>    
       							 <li><a >Welcome, <%= ((com.model.Viewer)session.getAttribute("viewer")).getUsername() %></a></li>
      						     <li><a href="./Logout.jsp">Logout</a></li>
  							</ul>     
                        </nav>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->
</body>
</html>