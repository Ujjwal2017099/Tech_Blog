
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.Dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="./css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!--navbar begins-->

        <link href="./css/style.css" rel="stylesheet" type="text/css"/>

        <nav class=" navbar navbar-expand-lg bgcolor">
            <a class="navbar-brand text-light" href="#">Tech-Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link text-light" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link text-light" href="#" data-toggle="modal" data-target="#postModal">Post <span class="sr-only">(current)</span></a>
                    </li>


                </ul>
                <ul class="navbar-nav mr-right">

                    <li class="nav-item active">
                        <a class="nav-link text-light" href="#"data-toggle="modal" data-target="#profile-modal"> <%= user.getName()%> </a>
                    </li>

                    <li class="nav-item active">
                        <a class="btn btn-outline-light " href="LogoutServlet">logout </a>
                    </li>
                </ul>
            </div>
        </nav>

        <!--navbar ends here-->

        <!--main body-->
        
        <main>
            <div class="container ">
                <div class="row ">
                <% 
                PostDao d = new PostDao(ConnectionProvider.getConnection());
                
                List<Post> posts = d.getAllPosts();
                
                for(Post p : posts){
                    %>
                    <div class="col-md-6 mt-5">
                        <div class="card">
                            
                            <div class="card-body">
                                <b><%=p.getpTitle()%></b>
                                <p><%=p.getpContent() %></p>
                            </div>
                            
                        </div>
                        
                        
                    </div>
                    
                    <%
                    }
                
                %>
                </div>
            </div>
            
        </main>
        
        
        <!--main body ends-->
        
        
        <!-- profile Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bgcolor text-light">
                        <h5 class="modal-title" id="exampleModalLabel"><%= user.getName()%></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">

                            <img class="mb-5"src="img/default.png" alt="alt" style="border-radius: 5%">
                            <br>
                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row">ID : </th>
                                        <td><%= user.getId()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Email : </th>
                                        <td><%= user.getEmail()%></td>
                                    </tr>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>


        <!--post  modal-->

        <div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="container">
                            <h5 class="modal-title text-center" id="exampleModalLabel">Create Post</h5>
                        </div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="PostServlet" method="post">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---select category---</option>
                                    <%
                                        PostDao dao = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = dao.getCategory();

                                        for (Category c : list) {
                                    %>
                                    <option value="<% c.getCid();%>"><%= c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>

                            </div>
                            <div class="form-group">
                                <input id="pTitle" name="pTitle" type='text' placeholder="Enter post title : " class="form-control" />
                            </div>
                            <div class="form-group">
                                <textarea name="pContent" class="form-control" placeholder="Write Post" style="height : 300px"></textarea>

                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-primary" >Submit</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>




        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        
        <script src="./js/index.js" type="text/javascript"></script>

        <script>
                    $(document).ready(function (e) {
//                alert("loaded")
                        $("#add-post-form").on("submit", function (event) {
//                            event.preventDefault();
                            console.log("submit");
                            var form = new FormData(this);

                            $.ajax({
                                url: "PostServlet",
                                type: 'POST',
                                data: form,
                                success: function (data, textStatus, jqXHR) {
                                    console.log(textStatus + " " + data);
                                    
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    
                                },
                                processData: false,
                                contentTYpe: false
                            });
                        });
                    });
        </script>
    </body>
</html>
