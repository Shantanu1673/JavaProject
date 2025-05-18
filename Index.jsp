<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
    if (session.getAttribute("viewer") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Anime | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/plyr.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

<%@ include file="Header.jsp" %>

<%@ include file ="Banner.jsp" %>

	    <!-- Product Section Begin -->
	    <section class="product spad">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="trending__product">
	                        <div class="row">
	                            <div class="col-lg-3 col-md-3 col-sm-3">
	                                <div class="section-title">
	                                    <h4>All Anime</h4>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="row">
	                        <%
	       									  Connection cn= new DBUtil().getConnection();
	       									  String qry="select * from newanime";
	       									  PreparedStatement st=cn.prepareStatement(qry);
	       									  ResultSet rs=st.executeQuery();
	       									  while(rs.next())
	       									  {
	       								%> 
	                            <div class="col-lg-4 col-md-4 col-sm-4">
	                                <div class="product__item">
	                                    <div class="product__item__pic set-bg" data-setbg="anime-images/<%= rs.getString("image") %>">
	                 
	                                   </div>
	                                    <div class="product__item__text">
	                                        <form method="post" action="Anime-Details.jsp">
	                                        <button class="site-btn" type="submit" name="animeid" value="<%=rs.getInt(1)%>">
	                                        <%=rs.getString(2) %>
	                                        </button>
	                                        </form>
	                                        <h5></h5>
	                                        
	                                    </div>
	                                </div>
	                            </div>
	                              <%
	       									  }
	       									  cn.close();	
	                                  %>
	                         </div>
	                    </div>
	                </div>
	           </div>
	</div>
	</section>
	<!-- Product Section End -->

<%@ include file="Footer.jsp" %>

  <!-- Search model Begin -->
  <div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/player.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>


</body>

</html>