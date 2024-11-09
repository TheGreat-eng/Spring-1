<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Create Users - Hỏi Dân IT</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");

                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <div id="layoutSidenav_nav">
                        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                            <div class="sb-sidenav-menu">
                                <div class="nav">
                                    <div class="sb-sidenav-menu-heading">Features</div>
                                    <a class="nav-link" href="index.html">
                                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                        Dashboard
                                    </a>

                                    <a class="nav-link" href="/admin/user">
                                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                        User
                                    </a>

                                    <a class="nav-link" href="/admin/product">
                                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                        Product
                                    </a>

                                    <a class="nav-link" href="/admin/order">
                                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                        Order
                                    </a>




                                    <div class="sb-sidenav-menu-heading">Interface</div>

                                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                        data-bs-target="#collapsePages" aria-expanded="false"
                                        aria-controls="collapsePages">
                                        <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                        Pages
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="collapsePages" aria-labelledby="headingTwo"
                                        data-bs-parent="#sidenavAccordion">
                                        <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                                data-bs-target="#pagesCollapseAuth" aria-expanded="false"
                                                aria-controls="pagesCollapseAuth">
                                                Authentication
                                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i>
                                                </div>
                                            </a>
                                            <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne"
                                                data-bs-parent="#sidenavAccordionPages">
                                                <nav class="sb-sidenav-menu-nested nav">
                                                    <a class="nav-link" href="login.html">Login</a>
                                                    <a class="nav-link" href="register.html">Register</a>
                                                    <a class="nav-link" href="password.html">Forgot Password</a>
                                                </nav>
                                            </div>
                                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                                data-bs-target="#pagesCollapseError" aria-expanded="false"
                                                aria-controls="pagesCollapseError">
                                                Error
                                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i>
                                                </div>
                                            </a>
                                            <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne"
                                                data-bs-parent="#sidenavAccordionPages">
                                                <nav class="sb-sidenav-menu-nested nav">
                                                    <a class="nav-link" href="401.html">401 Page</a>
                                                    <a class="nav-link" href="404.html">404 Page</a>
                                                    <a class="nav-link" href="500.html">500 Page</a>
                                                </nav>
                                            </div>
                                        </nav>
                                    </div>
                                    <div class="sb-sidenav-menu-heading">Addons</div>
                                    <a class="nav-link" href="charts.html">
                                        <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                        Charts
                                    </a>
                                    <a class="nav-link" href="tables.html">
                                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                        Tables
                                    </a>
                                </div>
                            </div>
                            <div class="sb-sidenav-footer">
                                <div class="small">Logged in as:</div>
                                Hỏi Dân IT
                            </div>
                        </nav>
                    </div>
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Users</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Users</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Create a user</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/user/create"
                                                modelAttribute="newUser">
                                                <div class="mb-3">
                                                    <label class="form-label">Email:</label>
                                                    <form:input type="email" class="form-control" path="email" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Password:</label>
                                                    <form:input type="text" class="form-control" path="password" />
                                                </div>
                                                <div class="mb-3">
                                                    <label class="form-label">Phone number:</label>
                                                    <form:input type="text" class="form-control" path="phone" />
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Full name:</label>
                                                    <form:input type="text" class="form-control" path="fullname" />
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Address:</label>
                                                    <form:input type="text" class="form-control" path="address" />
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Role:</label>
                                                    <form:select path="roleName" class="form-control">
                                                        <form:option value="ADMIN" label="ADMIN" />
                                                        <form:option value="USER" label="USER" />
                                                    </form:select>
                                                </div>

                                                <div class="mb-3">
                                                    <label class="form-label">Avatar:</label>
                                                    <input type="file" id="avatarFile" class="form-control"
                                                        name="avatar" accept="image/*" />
                                                    <img id="avatarPreview" src="#" alt="Avatar Preview"
                                                        style="display:none; max-width:100px; margin-top:10px;" />
                                                </div>



                                                <button type="submit" class="btn-primary">Create</button>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>



            </body>

            </html>