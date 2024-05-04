<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="view/user/photoGallery/photo.css" />
        <c:if test="${requestScope.type eq 1}"> <%--photo--%>
            <title>Photo Gallery</title>
        </c:if>
        <c:if test="${requestScope.type eq 2}"> <%--video--%>
            <title>Video Gallery</title>
        </c:if>
        <c:if test="${requestScope.type eq 3}"> <%--cast--%>
            <title>All Cast and Crew</title>
        </c:if>
    </head>
    <body>
        <jsp:include page="/view/user/Component/header/Header.jsp" /><br><br>
        <div class="container">
            <div class="container_left">
                <div class="photo_container">
                    <div style="display: flex; justify-content: space-between">
                        <div style="display: flex">
                            <div class="photo_img">
                                <img
                                    src="${requestScope.main}"
                                    style="border-radius: 20"
                                    alt=""
                                    width="100%"
                                    height="100%"
                                    />
                            </div>
                            <div class="name_year_manu">
                                <div>
                                    <span class="name_img">Name</span>
                                    <span class="year_img"> (?) (Year)</span>
                                </div>

                                <c:if test="${requestScope.type eq 1}"> <%--photo--%>
                                    <div class="photo_gallery">Photo Gallery</div>
                                </c:if>
                                <c:if test="${requestScope.type eq 2}"> <%--video--%>
                                    <div class="photo_gallery">Video Gallery</div>
                                </c:if>
                                <c:if test="${requestScope.type eq 3}"> <%--cast--%>
                                    <div class="photo_gallery">All cast and crew</div>
                                </c:if>
                            </div>
                        </div>
                        <div class="edit">Edit</div>
                    </div>
                    <div class="filter_photo">
                        <div>1-48 of 124 Photos</div>
                        <div>Prev | 1 2 3 ... 5 | Next</div>
                        <div style="display: flex; align-items: center; gap: 10px">
                            Sort by
                            <select class="select_date" name="" id="">
                                <option value="">Date</option>
                            </select>
                            <img src="../assets/Swap_btn.png" alt="" />
                        </div>
                    </div>
                    <div class="img_photo_gallery_container">
                        <c:if test="${requestScope.type eq 1}"> <%--photo--%>
                            <c:forEach items="${requestScope.others}" var="item">
                                <div class="img_photo_gallery">
                                    <img src="${item.imageLink}" class="img_photo_gallery">
                                </div>
                            </c:forEach>
                        </c:if>
                        <c:if test="${requestScope.type eq 2}"> <%--video--%>
                            <c:forEach items="${requestScope.others}" var="item">
                                <iframe width="500" height="350" src="${item.url}" 
                                        title="YouTube video player" frameborder="0" 
                                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                                        allowfullscreen>
                                </iframe>                              
                            </c:forEach>
                        </c:if>
                        <c:if test="${requestScope.type eq 3}"> <%--cast--%>
                            <c:forEach items="${requestScope.others}" var="item">
                                <div class="img_photo_gallery"><img src="${item.url}" class="img_photo_gallery"></div>
                                </c:forEach>
                            </c:if>                       
                    </div>

                    <div class="filter_bottom">
                        <div>1 - 15 of 124 Videos</div>
                        <div>Prev | 1 2 3 ... 5 | Next</div>
                    </div>
                </div>
                <div class="see_also_container">
                    <div class="see_also_text">See Also</div>
                    <div class="photo_gallery_see_also">Photo Gallery</div>
                </div>
            </div>
            <div class="container_right">
                <div class="show_less_container">
                    <div
                        class="show_less_title"
                        style="border-bottom: 1px solid; padding-bottom: 10px"
                        >
                        Name
                    </div>
                    <div style="margin-top: 10px">
                        <div class="show_less_title">Details</div>
                        <div class="show_less_content">Full Cast and Crew</div>
                    </div>
                    <div style="margin-top: 10px">
                        <div class="show_less_title">Photo & Video</div>
                        <div class="show_less_content">Photo Gallery</div>
                        <div class="show_less_content">Trailers and Videos</div>
                    </div>
                    <div style="margin-top: 10px">
                        <div class="show_less_title">Opinion</div>
                        <div class="show_less_content">User Reviews</div>
                    </div>
                    <div
                        class="show_less_title"
                        style="margin-top: 10px; display: flex; align-items: center; gap: 10px;"
                        >
                        <img src="../assets/arrow_up.png" alt="" />Show less
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/view/user/Component/footer/Footer.jsp" />

    </body>
</html>
