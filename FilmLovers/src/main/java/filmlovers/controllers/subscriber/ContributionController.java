/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.controllers.subscriber;

import filmlovers.model.Account.AccountDTO;
import filmlovers.model.Film.FilmDAO;
import filmlovers.model.Film.FilmDTO;
import filmlovers.model.Film.PhotoDTO;
import filmlovers.model.Film.VideoDTO;
import filmlovers.utils.URLValidation;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author vothimaihoa
 */
public class ContributionController extends HttpServlet {

    private final String CONTRIBUTE_HOME = "view/user/contribute/contribute-home.jsp";
    private final String ADD_FILM = "view/user/contribute/addNewFilm/add-item.jsp";
    private final String ADD_GENRE = "view/user/contribute/add-genre.jsp";
    private final String ADD_VIDEO = "view/user/contribute/add-video.jsp";
    private final String ADD_PHOTO = "view/user/contribute/add-photo.jsp";
    private final String FILM_DETAIL = "/film-lovers/film-detail?id=";

    /**
     * Handles the HTTP <code>GET</code> method. Take the form out
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String link = CONTRIBUTE_HOME;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                link = CONTRIBUTE_HOME;
            } else if (action.equals("add-film")) {
                link = ADD_FILM;
            } else if (action.equals("add-genre")) {
                String filmId_raw = request.getParameter("filmId");
                int filmId = Integer.parseInt(filmId_raw);
                FilmDAO filmDAO = new FilmDAO();
                List<String> genres = filmDAO.getGenres();
                List<String> filmGenres = filmDAO.getGenres(filmId);
                request.setAttribute("optionGenres", genres);
                request.setAttribute("filmGenres", filmGenres);
                link = ADD_GENRE;
            } else if (action.equals("add-video")) {
                link = ADD_VIDEO;
            } else if (action.equals("add-photo")) {
                link = ADD_PHOTO;
            }
        } catch (Exception e) {
            log("Exception: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(link).forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method. Handle form submission and DAO
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String link = CONTRIBUTE_HOME;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                link = CONTRIBUTE_HOME;
            } else if (action.equals("add-film")) {
                addFilm(request, response);
            } else if (action.equals("add-genre")) {
                addGenre(request, response);
            } else if (action.equals("update-film")) {
            } else if (action.equals("add-video")) {
                int valid = addVideo(request, response);
                if (valid == 1) {
                    link = ADD_VIDEO;
                }
            } else if (action.equals("add-photo")) {
//                int valid = addPhoto(request, response);
//                if (valid == 1) {
//                    link = ADD_PHOTO;
//                }
            }

        } catch (Exception e) {
            log("Exception: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(link).forward(request, response);
        }
    }

    private void addFilm(HttpServletRequest request, HttpServletResponse response)
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
        String photo = request.getParameter("image");
        String cover_url = request.getParameter("cover_url");

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

        if (photo != null && !photo.isEmpty()) {
            film.setPhoto(photo);
        }
        if (cover_url != null && !cover_url.isEmpty()) {
            film.setPhoto(cover_url);
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
        film.setCheckedStatus("processing");
        film.setAccountId(account.getId());

        boolean success = filmDAO.insertFilm(film);

        String message;
        if (success) {
            message = "Your suggestion has been received. Please wait for our review. You will receive an email with our response when we finish reviewing.";
        } else {
            message = "Thank you for your contribution. However, the information you suggested has already been contributed by another user. If you don't see that information on the website now, please be patient as we are still processing it for review.";
        }
        request.setAttribute("message", message);
    }

    private void addGenre(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // handle add genre
        String filmId_raw = request.getParameter("filmId");
        String[] genres_raw = request.getParameterValues("genres");
        int filmId = 0;
        try {
            filmId = Integer.parseInt(filmId_raw);
        } catch (NumberFormatException e) {
            log("Wrong format of film ID");
        }

        List<String> genres = new ArrayList<>();
        if (genres_raw != null) {
            genres = Arrays.asList(genres_raw);
        }
        String checkedStatus = "processing";

        // create success message
        FilmDAO filmDAO = new FilmDAO();

        HttpSession session = request.getSession(false);
        AccountDTO account = (AccountDTO) session.getAttribute("authentication");
        int accountId = account.getId();
        Date sendAt = new java.sql.Date(System.currentTimeMillis());

        boolean success = true;
        for (String genre : genres) {
            if (!filmDAO.insertGenre(filmId, genre, checkedStatus, sendAt, accountId)) {
                success = false;
            }
        }
        String message;
        if (success) {
            message = "Your suggestion has been received. Please wait for our review. You will receive an email with our response when we finish reviewing.";
        } else {
            message = "Thank you for your contribution. However, some of the information you suggested has already been contributed by another user. If you don't see those information on the website now, please be patient as we are still processing it for review.";
        }
        request.setAttribute("message", message);
    }

    private int addVideo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String filmId_raw = request.getParameter("filmId");
        int filmId = 0;
        try {
            filmId = Integer.parseInt(filmId_raw);
        } catch (NumberFormatException e) {
            log("Wrong format of film ID");
        }
        String url = request.getParameter("url");
        String id = URLValidation.extractVideoId(url);
        if (id == null) {
            request.setAttribute("invalidMsg", "The url is not valid! Please provide a video url from Youtube!");
            return 1;
        }

        String title = request.getParameter("video-title");

        VideoDTO video = new VideoDTO();
        if (title != null && !title.isEmpty()) {
            video.setTitle(title);
        }

        String type = request.getParameter("type");

        HttpSession session = request.getSession(false);
        AccountDTO account = (AccountDTO) session.getAttribute("authentication");
        int accountId = account.getId();
        String checkedStatus = "processing";
        if (account.getRole().equals("admin")) {
            checkedStatus = "approved";
        }
        Date sendAt = new java.sql.Date(System.currentTimeMillis());
        FilmDAO filmDAO = new FilmDAO();
        System.out.println(filmId);
        boolean success = filmDAO.insertVideo(filmId, title, url, type, checkedStatus, accountId, sendAt);
        String message = "";

        if (success) {
            if (account.getRole().equals("user")) {
                message = "Your suggestion has been received. Please wait for our review. You will receive an email with our response when we finish reviewing.";
            } else {
                message = "Film updated with new information. Go back to film detail to see it!";
            }
        } else {
            if (account.getRole().equals("user")) {
                message = "Thank you for your contribution. However, some of the information you suggested has already been contributed by another user. If you don't see those information on the website now, please be patient as we are still processing it for review.";
            }
            else {
                message = "Invalid update information!";
            }
        }
        request.setAttribute("message", message);
        return 0;
    }

    private int addPhoto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String filmId_raw = request.getParameter("filmId");
        int filmId = 0;
        try {
            filmId = Integer.parseInt(filmId_raw);
        } catch (NumberFormatException e) {
            log("Wrong format of film ID");
        }
        String imgLink = request.getParameter("imageLink");
        
        if (!URLValidation.checkImageLink(imgLink)) {
            request.setAttribute("invalidMsg", "The url is not valid! Please provide a valid image url!");
            return 1;
        }
                
        String title = request.getParameter("img-title");
        
        String checkedStatus = "processing";
        
        HttpSession session = request.getSession(false);
        AccountDTO account = (AccountDTO) session.getAttribute("authentication");
        int accountId = account.getId();
        
        Date sendAt = new java.sql.Date(System.currentTimeMillis());
        FilmDAO filmDAO = new FilmDAO();
        
        boolean success = filmDAO.insertPhoto(filmId, title, imgLink, checkedStatus, accountId, sendAt);
        String message;
        if (success) {
            message = "Your suggestion has been received. Please wait for our review. You will receive an email with our response when we finish reviewing.";
        } else {
            message = "Thank you for your contribution. However, some of the information you suggested has already been contributed by another user. If you don't see those information on the website now, please be patient as we are still processing it for review.";
        }
        request.setAttribute("message", message);
        return 0;
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
