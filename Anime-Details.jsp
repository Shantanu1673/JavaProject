<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

  

<!-- Anime Section Begin -->
<section class="anime-details spad">
    <div class="container">
        <div class="anime__details__content">
            <%
                int animeid = Integer.parseInt(request.getParameter("animeid"));
                Connection cn = new DBUtil().getConnection();

                // Get anime details
                PreparedStatement animeStmt = cn.prepareStatement("SELECT * FROM newanime WHERE animeid=?");
                animeStmt.setInt(1, animeid);
                ResultSet animeRs = animeStmt.executeQuery();

                if (animeRs.next()) {
            %>
            <div class="row">
                <div class="col-lg-3">
                    <div class="anime__details__pic set-bg" data-setbg="anime-images/<%= animeRs.getString("image") %>">
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="anime__details__text">
                        <div class="anime__details__title">
                            <h3><%= animeRs.getString("animename") %></h3>
                        </div>
                        <p><%= animeRs.getString("description") %></p>

                        <!-- Dropdown for episodes -->
                        <div class="anime__details__episodes mt-4">
                            <div class="section-title">
                                <h5>Select Episode</h5>
                            </div>
                            <form action="Anime-Watching.jsp" method="post">
                                <input type="hidden" name="animeid" value="<%= animeid %>">
                                <select name="episodeid" class="form-control" ">
                                    <%
                                        // Get episodes for the anime
                                        PreparedStatement epStmt = cn.prepareStatement("SELECT * FROM newepisode WHERE animeid=? ORDER BY episodeno ASC");
                                        epStmt.setInt(1, animeid);
                                        ResultSet epRs = epStmt.executeQuery();
                                        while (epRs.next()) {
                                    %>
                                    <option value="<%= epRs.getInt("episodeid") %>">Episode <%= epRs.getInt("episodeno") %></option>
                                    <%
                                        }
                                        cn.close();
                                    %>
                                </select>
                                <button class="site-btn" type="submit">Watch Now</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>
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