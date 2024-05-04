/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.controllers.web;

import filmlovers.model.Film.FilmDAO;
import filmlovers.model.Film.FilmDTO;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vothimaihoa
 */
public class LoadMoreController extends HttpServlet {

    private static final int FILMS_PER_PAGE = 6;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        int lastFilmId = parseIntParam(request, "lastFilmId");
        System.out.println(lastFilmId);
        String title = request.getParameter("title");

        int releaseYearFrom = parseIntParam(request, "releaseYearFrom");
        int releaseYearTo = parseIntParam(request, "releaseYearTo");
        String country = request.getParameter("country");
        String language = request.getParameter("language");
        String type = request.getParameter("type");

        List<String> genres = null;
        String genresParam = request.getParameter("genres");

        if (genresParam != null && !genresParam.isEmpty()) {
            String[] genres_raw = genresParam.split(",");
            genres = Arrays.asList(genres_raw);
        }

        List<String> keywords = null;
        String[] keywords_raw = request.getParameterValues("keywords");
        if (keywords_raw != null) {
            keywords = Arrays.asList(keywords_raw);
        }

        int runtimeFrom = parseIntParam(request, "runtimeFrom");
        int runtimeTo = parseIntParam(request, "runtimeTo");

        FilmDAO filmDAO = new FilmDAO();

        // get list of product for this page
        List<FilmDTO> films;
//        if (action.equals("previous")) {
//            films = filmDAO.searchByReverseFilter(title, lastFilmId, releaseYearFrom, releaseYearTo,
//                    country, language, type, genres, runtimeFrom,
//                    runtimeTo, keywords, FILMS_PER_PAGE);
//        } else {
        films = filmDAO.searchByFilter(title, lastFilmId, releaseYearFrom,
                releaseYearTo, country, language, type, genres, runtimeFrom,
                runtimeTo, keywords, FILMS_PER_PAGE);
//        }
        request.setAttribute("lastFilmId", lastFilmId);
        request.setAttribute("title", title);
        request.setAttribute("releaseYearFrom", releaseYearFrom);
        request.setAttribute("releaseYearTo", releaseYearTo);
        request.setAttribute("country", country);
        request.setAttribute("language", language);
        request.setAttribute("type", type);
        request.setAttribute("genres", genres);
        request.setAttribute("keywords", keywords);
        request.setAttribute("runtimeFrom", runtimeFrom);
        request.setAttribute("runtimeTo", runtimeTo);
        request.setAttribute("optionGenres", filmDAO.getGenres());

        request.setAttribute("searchFilms", films);

        request.getRequestDispatcher("/view/user/filter/filter.jsp").forward(request, response);
        String html = "";
        // test ajax with search.jsp
//        for (FilmDTO film : films) {
//            html += ("<div class=\"filmRow\" id=\"filmRow_" + film.getId() + "\">\n"
//                    + "                    <a href=\"/film-lovers/film-detail?id=" + film.getId() + "\">\n"
//                    + "                        <div class=\"items_trending\">\n"
//                    + "                            <img src=\"" + film.getPhoto() + "\" width=\"169px\" height=\"240px\" style=\"border-radius: 10px\" />\n"
//                    + "                            <div class=\"star_rating\">\n"
//                    + "                                <div class=\"rating\">8.1</div> <!--average film rating-->\n"
//                    + "                            </div>\n"
//                    + "                        </div>\n"
//                    + "                        <div class=\"item_name\">" + film.getTitle() + "</div>\n"
//                    + "                        <div class=\"item_type_and_year\">" + film.getType() + "</div>\n"
//                    + "                        <div class=\"item_type_and_year\">" + film.getReleaseYear() + "</div>\n"
//                    + "                    </a>\n"
//                    + "</div>");
//        }

        // test ajax with filter.jsp
//        for (FilmDTO film : films) {
//            html += "<div class=\"div_items_trending filmRow\" id=\"filmRow_" + film.getId() + "\">\n"
//                    + "                                <div class=\"items_trending\">\n"
//                    + "                                    <a href=\"/film-lovers/film-detail?id=" + film.getId() + "\">\n"
//                    + "                                        <img\n"
//                    + "                                            src=\"" + film.getPhoto() + "\"\n"
//                    + "                                            width=\"169\"\n"
//                    + "                                            height=\"240\"\n"
//                    + "                                            style=\"border-radius: 10px\"\n"
//                    + "                                            />\n"
//                    + "                                        <div class=\"star_rating\">\n"
//                    + "                                            <div class=\"rating\">8.1</div>\n"
//                    + "                                        </div>\n"
//                    + "                                    </a>\n"
//                    + "                                </div>\n"
//                    + "                                <div class=\"item_name\">" + film.getTitle() + "</div>\n"
//                    + "                                <div class=\"item_type_and_year\">" + film.getType() + "</div>\n"
//                    + "                                <div class=\"item_type_and_year\">" + film.getReleaseYear() + "</div>\n"
//                    + "\n"
//                    + "                            </div>";
//        }
//        response.getWriter().print(html);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private int parseIntParam(HttpServletRequest request, String paramName) {
        String raw = request.getParameter(paramName);
        int param;
        if (raw == null || raw.trim().isEmpty()) {
            if (paramName.equals("lastFilmId")) {
                param = 0;
            } else {
                param = -1;
            }
        } else {
            param = Integer.parseInt(raw);
        }
        return param;
    }

}
