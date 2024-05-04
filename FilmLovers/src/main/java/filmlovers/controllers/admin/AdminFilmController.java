/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.controllers.admin;

import filmlovers.model.Account.AccountDTO;
import filmlovers.model.Film.FilmDAO;
import filmlovers.model.Film.FilmDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vothimaihoa
 */
public class AdminFilmController extends HttpServlet {

    private final String ADD_FILM = "/view/admin/add-item.jsp";
    private final String EDIT_HOME = "/view/user/contribute/contribute-home.jsp";
    private final String FILM_LIST = "/view/admin/list/listOfAllMovies.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.equals("") || action.equals("list")) {
            showList(request, response);
        } else if (action.equals("add")) {
            request.getRequestDispatcher(ADD_FILM).forward(request, response);
        }
    }
//*****************************************************************************************************************

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

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                addNewFilm(request, response);
                break;
            case "update":
                updateFilmInfo(request, response);
                break;
        }
    }
//*****************************************************************************************************************

    /**
     * This function shows list of all films
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void showList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FilmDAO fd = new FilmDAO();
        String page_raw = request.getParameter("page");
        int page;
        if (page_raw == null || page_raw.trim().isEmpty()) {
            page = 1;
        } else {
            page = Integer.parseInt(page_raw);
        }

        int size = 6;
        List<FilmDTO> list = fd.list("approved", page, size);
        request.setAttribute("filmList", list);

        request.setAttribute("lastPage", Math.ceil(fd.countFilm("") / size));
        request.setAttribute("currentPage", page);

        RequestDispatcher rd = request.getRequestDispatcher(FILM_LIST);
        rd.forward(request, response);
    }
//*****************************************************************************************************************

    /**
     * This function gets information of new film from request and add new film
     * to database
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void addNewFilm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        String type = request.getParameter("type");
        String country = request.getParameter("country");
        int releaseYear = Integer.parseInt(request.getParameter("release_year"));
        int releaseMonth = Integer.parseInt(request.getParameter("release_month"));
        String language = request.getParameter("language");
        String releaseStatus = request.getParameter("release_status");
        String description = request.getParameter("description");
        String storyLine = request.getParameter("story_line");

        HttpSession session = request.getSession(false);
        AccountDTO account = (AccountDTO) session.getAttribute("authentication");

        FilmDAO filmDAO = new FilmDAO();
        FilmDTO film = new FilmDTO();
        film.setTitle(title);
        film.setReleaseYear(releaseYear);
        film.setType(type);
        film.setCountry(country);
        film.setReleaseMonth(releaseMonth);

        if (language != null && !language.isEmpty()) {
            film.setLanguage(language);
        }

        if (releaseStatus != null && !releaseStatus.isEmpty()) {
            film.setReleaseStatus(releaseStatus);
        }

        if (description != null && !description.isEmpty()) {
            film.setDescription(description);
        }

        if (storyLine != null && !storyLine.isEmpty()) {
            film.setStoryLine(storyLine);
        }

        int runtime = 0;
        try {
            runtime = Integer.parseInt(request.getParameter("runtime"));
        } catch (NumberFormatException e) {
            log("runtime is not in number format");
        }
        film.setRuntime(runtime);

        film.setVisibleStatus("show");
        film.setAddDate(new java.sql.Date(System.currentTimeMillis()));
        film.setCheckedStatus("approved");
        film.setAccountId(account.getId());
        boolean success = filmDAO.insertFilm(film);

        if (success) {
            response.sendRedirect(request.getContextPath() + "/admin/film");
        } else {
            String mess = "Cannot add this film!";
            request.setAttribute("error", mess);
            request.getRequestDispatcher(ADD_FILM).forward(request, response);
        }
    }
//*****************************************************************************************************************

    /**
     * This function gets information from request and update film details in
     * database
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void updateFilmInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(EDIT_HOME).forward(request, response);
    }
//*****************************************************************************************************************

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
