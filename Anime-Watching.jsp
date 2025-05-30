<!DOCTYPE html>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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


<!-- Anime Section Begin -->
<section class="anime-details spad">
    <div class="container">
        <%
            int animeid = Integer.parseInt(request.getParameter("animeid"));
            int episodeid = Integer.parseInt(request.getParameter("episodeid"));

            Connection cn = new DBUtil().getConnection();

            // Get anime name
            String animename = "";
            PreparedStatement animeStmt = cn.prepareStatement("SELECT animename FROM newanime WHERE animeid=?");
            animeStmt.setInt(1, animeid);
            ResultSet animeRs = animeStmt.executeQuery();
            if (animeRs.next()) {
                animename = animeRs.getString("animename");
            }

            // Get selected episode
            String video = "";
            int episodeno = 0;
            PreparedStatement epStmt = cn.prepareStatement("SELECT video, episodeno FROM newepisode WHERE animeid=? AND episodeid=?");
            epStmt.setInt(1, animeid);
            epStmt.setInt(2, episodeid);
            ResultSet epRs = epStmt.executeQuery();
            if (epRs.next()) {
                video = epRs.getString("video");
                episodeno = epRs.getInt("episodeno");
            }

            cn.close();
        %>

        <div class="row">
            <div class="col-lg-12 text-center">
                <h3 style="color: white;"><%= animename %> - Episode <%= episodeno %></h3>
            </div>
            <div class="col-lg-12 mt-4">
                <div class="anime__video__player">
                    <video id="player" playsinline >
                        <source src="anime-video/<%= video %>" type="video/mp4" />
                        Your browser does not support the video tag.
                    </video>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Anime Section End -->

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