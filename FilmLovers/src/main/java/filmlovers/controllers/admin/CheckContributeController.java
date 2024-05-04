/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.controllers.admin;

import filmlovers.model.Film.FilmDAO;
import filmlovers.model.Film.FilmDTO;
import filmlovers.model.Film.VideoDTO;
import filmlovers.utils.URLValidation;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vothimaihoa
 */
public class CheckContributeController extends HttpServlet {

    private final String LIST_FILM_CONTRIBUTION_PAGE = "/view/admin/list/film-contribution.jsp";
    private final String ADD_FILM = "/view/user/contribute/add-film.jsp";
    private final String FILM_DETAIL = "/film-lovers/film-detail?id=";
    private final String ADD_GENRE = "/view/user/contribute/add-genre.jsp";
//    private final String ADD_VIDEO = "/view/user/contribute/add-video.jsp";
    private final String ADD_VIDEO = "/view/admin/check-detail/check-video.jsp";

    private final String LIST_VIDEO_CONTRIBUTION_PAGE = "/view/admin/list/video-contribution.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equals("list-film")) {
            String page_raw = request.getParameter("page");
            int page;
            if (page_raw == null || page_raw.trim().isEmpty()) {
                page = 1;
            } else {
                page = Integer.parseInt(page_raw);
            }
            FilmDAO filmDAO = new FilmDAO();
            List<FilmDTO> list = filmDAO.list("processing", page, 6);
            request.setAttribute("list", list);
            request.getRequestDispatcher(LIST_FILM_CONTRIBUTION_PAGE).forward(request, response);

        } else if (action.equals("list-video")) {
            FilmDAO filmDAO = new FilmDAO();
            List<VideoDTO> list = filmDAO.listVideo("processing");
            request.setAttribute("list", list);
            request.getRequestDispatcher(LIST_VIDEO_CONTRIBUTION_PAGE).forward(request, response);

        } else if (action.equals("add-film")) {
            int filmId = Integer.parseInt(request.getParameter("id"));
            FilmDAO filmDAO = new FilmDAO();
            FilmDTO film = filmDAO.getFilmDetailsById(filmId);
            request.setAttribute("film", film);

            request.setAttribute("previousAction", "check");
            request.getRequestDispatcher(ADD_FILM).forward(request, response);

        } else if (action.equals("add-video")) {
            int videoId = Integer.parseInt(request.getParameter("id"));
            FilmDAO filmDAO = new FilmDAO();
            VideoDTO video = filmDAO.getVideoById(videoId);
            request.setAttribute("video", video);
            request.setAttribute("filmId", video.getFilm_id());
            request.setAttribute("previousAction", "check");
            request.getRequestDispatcher(ADD_VIDEO).forward(request, response);
        }
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
        String action = request.getParameter("action");
        String filmId_raw = request.getParameter("filmId");
        String videoId_raw = request.getParameter("videoId");
        int filmId = 0;
        try {
            filmId = Integer.parseInt(filmId_raw);
        } catch (NumberFormatException e) {
            log("film id does not have right format");
        }
        Integer videoId = 0;
        try {
            videoId = Integer.parseInt(videoId_raw);
        } catch (NumberFormatException e) {
            log("videoId does not have right format");
        }

        if ("approve-film".equals(action)) {
            setStatus("Film", "approved", filmId);
            response.sendRedirect(FILM_DETAIL + filmId);

        } else if ("reject-film".equals(action)) {
            setStatus("Film", "rejected", filmId);
            response.sendRedirect("/film-lovers/admin/contribute-check");

        } else if ("approve-video".equals(action)) {
            setStatus("Video", "approved", videoId);
            response.sendRedirect(FILM_DETAIL + filmId);

        } else if ("reject-video".equals(action)) {
            setStatus("video", "rejected", filmId);
            response.sendRedirect("/film-lovers/admin/contribute-check");
        }
    }

    private void setStatus(String table, String status, int filmId) {
        FilmDAO filmDAO = new FilmDAO();
        filmDAO.updateCheckedStatus(table, status, filmId);
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

}
