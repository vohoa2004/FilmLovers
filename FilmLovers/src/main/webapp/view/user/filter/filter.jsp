<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="/film-lovers/view/user/filter/filter.css" />
        <title>Trending Film</title>
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/nouislider/distribute/nouislider.min.css"
            />

        <script src="https://cdn.jsdelivr.net/npm/nouislider/distribute/nouislider.min.js"></script>
        <style>
            .cat{
                margin: 4px;
                background-color: #E5E5E5;
                border-radius: 4px;
                border: 1px solid #fff;
                overflow: hidden;
                float: left;
                border-radius: 50px;
            }

            .cat label {
                float: left; line-height: 3.0em;
                width: 7.0em; height: 3.0em;
            }

            .cat label span {
                text-align: center;
                padding: 3px 0;
                display: block;
            }

            .cat label input {
                position: absolute;
                display: none;
                color: #fff !important;
            }

            /* selects all of the text within the input element and changes the color of the text */
            .cat label input + span{color: #000;}

            /* This will declare how a selected input will look giving generic properties */
            .cat input:checked + span {
                color: #ffffff;
                text-shadow: 0 0  6px rgba(0, 0, 0, 0.8);
            }


            /*
            This following statements selects each category individually that contains an input element that is a checkbox and is checked (or selected) and chabges the background color of the span element.
            */

            .action input:checked + span{background-color: #0f1116;}
        </style>
    </head>
    <body>
        <jsp:include page="/view/user/Component/header/Header.jsp" flush="true"/>
        <div class="trending_container">
            <div class="trending">Trending</div>
            <div class="body_product">
                <div class="filter_container">
                    <form action="film" method="POST">
                        <%--filtering--%>
                        <div class="filter_chilren_container">
                            <div class="filter_children_header">Filter</div>
                            <label for="title" style="font-weight: bold;" class="date_header">Title: </label>
                            <input type="text" id="title" name="title" value="${requestScope.title}" class="form-control"><br/>

                            <div class="date">
                                <div class="date_header" style="font-weight: bold;">Release Year</div>
                                <div class="from_to_container">
                                    <div class="from_to" style="font-weight: bold;">From</div>
                                    <input type="number" id="releaseYearFrom" name="releaseYearFrom" value="${requestScope.releaseYearFrom != -1 ? requestScope.releaseYearFrom : ''}" class="form-control"><br/>
                                </div>
                                <div class="from_to_container" style="margin-top: 15px">
                                    <div class="from_to" style="font-weight: bold;">To</div>
                                    <input type="number" id="releaseYearTo" name="releaseYearTo" value="${requestScope.releaseYearTo != -1 ? requestScope.releaseYearTo : ''}" class="form-control"><br/>
                                </div>
                            </div>


                            <div class="type_container">
                                <div class="type_header">Type</div>
                                <div class="body_type">
                                    <div class="type_content">
                                        <input type="radio" name="type" value="movie" <c:if test="${requestScope.type eq 'movie'}">checked</c:if>>Movie</div>
                                        <div class="type_content">
                                            <input type="radio" name="type" value="series" <c:if test="${requestScope.type eq 'series'}">checked</c:if>> TV Series</div>
                                    </div>
                                </div>

                                <div class="type_container">
                                    <div class="type_header">Genres</div>
                                    <div class="body_genres">
                                    <c:forEach items="${requestScope.optionGenres}" var="genre">

                                        <c:set var="isChecked" value="false" />
                                        <c:if test="${not empty requestScope.genres}">
                                            <c:if test="${requestScope.genres.contains(genre)}">
                                                <c:set var="isChecked" value="true" />
                                            </c:if>
                                        </c:if>
                                        <div class="cat action">
                                            <label>
                                                <input type="checkbox" name="genres" value="${genre}" <c:if test="${isChecked}">checked</c:if>><span>${genre}</span>
                                                </label>
                                            </div>

                                    </c:forEach>
                                </div>
                            </div>

                            <%--Do later: display slider as value it holds--%>
                            <div class="type_container">
                                <div class="type_header">Runtime (minute)</div>
                                <div id="slider" class="gray-connect-slider"></div>
                                <p style="display: flex; gap: 10px; margin-top: 50px">
                                    <span>Values:</span>
                                    <span id="value-lower">${requestScope.runtimeFrom != -1 ? requestScope.runtimeFrom : ''}</span> -
                                    <span id="value-upper">${requestScope.runtimeTo != -1 ? requestScope.runtimeTo : ''}</span>
                                </p>
                            </div>
                            <input type="hidden" id="runtimeFrom" name="runtimeFrom" value="${requestScope.runtimeFrom != -1 ? requestScope.runtimeFrom : ''}">

                            <input type="hidden" id="runtimeTo" name="runtimeTo" value="${requestScope.runtimeTo != -1 ? requestScope.runtimeTo : ''}">

                        </div>
                        <input type="submit" class="search_btn" value="Submit">
                    </form>
                </div>

                <c:if test="${requestScope.message != null}">
                    <h3 style="color: red;">${requestScope.message}</h3>
                </c:if>
                <c:if test="${requestScope.message == null}">
                    <div class="product">
                        <div class="trending-second-box active">
                            <c:forEach var="film" items="${requestScope.searchFilms}">
                                <div class="div_items_trending filmRow" id="filmRow_${film.id}">
                                    <div class="items_trending">
                                        <a href="/film-lovers/film-detail?id=${film.id}">
                                            <img
                                                src="${film.photo}"
                                                width="169"
                                                height="240"
                                                style="border-radius: 10px"
                                                />
                                            <div class="star_rating">
                                                <div class="rating">${film.avgRating}</div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="item_name">${film.title}</div>
                                    <div class="item_type_and_year">${film.type}</div>
                                    <div class="item_type_and_year">${film.releaseYear}</div>

                                </div>
                            </c:forEach>

                            <%--form load more --%>
                            <form action="load-more" id="filterForm" method="POST">

                                <input type="hidden" id="lastFilmId" name="lastFilmId">

                                <input type="hidden" id="title" name="title" value="${requestScope.title}">

                                <input type="hidden" id="releaseYearFrom" name="releaseYearFrom" value="${requestScope.releaseYearFrom != -1 ? requestScope.releaseYearFrom : ''}">

                                <input type="hidden" id="releaseYearTo" name="releaseYearTo" value="${requestScope.releaseYearTo != -1 ? requestScope.releaseYearTo : ''}">

                                <%--                            <input type="hidden" id="country" name="country" value="${requestScope.country}">

                            <input type="hidden" id="language" name="language" value="${requestScope.language}">--%>

                                <input type="hidden" id="type" name="type" value="${requestScope.type}">

                                <input type="hidden" name="genres" value="${fn:join(requestScope.genres.toArray(), ',')}">

                                <input type="hidden" id="runtimeFrom" name="runtimeFrom" value="${requestScope.runtimeFrom != -1 ? requestScope.runtimeFrom : ''}">

                                <input type="hidden" id="runtimeTo" name="runtimeTo" value="${requestScope.runtimeTo != -1 ? requestScope.runtimeTo : ''}">

                                <%--Show more chi xuat hien khi co film elements--%>
                                <div class="show_more_container">
                                    <input id="loadMoreButton" class="show_more"
                                           action="action"
                                           onclick="window.history.go(-1); return false;"
                                           type="submit"
                                           value="Previous"
                                           />
                                    <button id="loadMoreButton" type="submit" class="show_more" onclick="loadMore()">
                                        Next
                                    </button>

                                </div>

                            </form>

                        </div>
                    </div>
                </c:if>
            </div>
        </div>
        <jsp:include page="/view/user/Component/footer/Footer.jsp" flush="true"/>
        <script>
            // hide/ show button load more
            var filmRows = document.querySelectorAll(".filmRow");
            var loadMoreButton = document.getElementById("loadMoreButton");

            if (filmRows.length === 0) {
                loadMoreButton.style.display = "none";
            } else {
                loadMoreButton.style.display = "block";
            }

            // handle runtime input data
            var runtimeFromValue = ${requestScope.runtimeFrom != -1 ? requestScope.runtimeFrom : 10};
            var runtimeToValue = ${requestScope.runtimeTo != -1 ? requestScope.runtimeTo : 360};

            var slider = document.getElementById("slider");

            noUiSlider.create(slider, {
                start: [runtimeFromValue, runtimeToValue],
                connect: true,
                range: {
                    min: 10,
                    "33%": 120,
                    "66%": 240,
                    max: 360
                },
                pips: {
                    mode: "values",
                    values: [10, 120, 240, 360],
                    density: 4
                },
                format: {
                    to: function (value) {
                        return value === 360 ? "360+" : Math.round(value);
                    },
                    from: function (value) {
                        return value.replace("+", "");
                    }
                }
            });

            slider.noUiSlider.on("update", function (values) {
                // set value to display
                var runtimeFrom = document.getElementById("value-lower");
                var runtimeTo = document.getElementById("value-upper");
                runtimeFrom.innerHTML = values[0];
                runtimeTo.innerHTML = values[1];

                // set value to form
                var runtimeFromInput = document.getElementById("runtimeFrom");
                var runtimeToInput = document.getElementById("runtimeTo");
                runtimeFromInput.value = parseFloat(values[0]);
                var runtimeToValue = values[1] === "360+" ? 360 : parseFloat(values[1]);
                runtimeToInput.value = runtimeToValue;

            });

            function loadMore() {
                var filmRows = document.querySelectorAll(".filmRow");

                var lastFilmId = null;
                if (filmRows.length > 0) {
                    var lastFilmRow = filmRows[filmRows.length - 1];
                    var idAttr = lastFilmRow.getAttribute("id");
                    var idParts = idAttr.split("_");
                    lastFilmId = idParts[idParts.length - 1];
                }
                document.getElementById("lastFilmId").value = lastFilmId;

            }
        </script>

    </body>
</html>
