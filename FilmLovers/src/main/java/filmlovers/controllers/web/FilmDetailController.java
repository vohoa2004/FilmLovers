/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.controllers.web;

import filmlovers.model.Account.AccountDTO;
import filmlovers.model.Film.FilmDAO;
import filmlovers.model.Film.FilmDTO;
import filmlovers.model.Film.PhotoDTO;
import filmlovers.model.Film.VideoDTO;
import filmlovers.model.Person.PersonDAO;
import filmlovers.model.Person.PersonDTO;
import filmlovers.model.Rating.RatingDAO;
import filmlovers.model.Rating.RatingDTO;
import filmlovers.model.Review.ReviewDAO;
import filmlovers.model.Review.ReviewDTO;
import filmlovers.utils.URLValidation;
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
public class FilmDetailController extends HttpServlet {

    private final String FILM_DETAIL = "view/user/film-detail/film-detail.jsp";
    private final String GALLERY = "view/user/photoGallery/photo.jsp";
    private final String REVIEW = "review";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");

        String id_raw = request.getParameter("id");
        int id = 0;
        if (id_raw == null) {
            id_raw = "";
        } else {
            id = Integer.parseInt(id_raw);
        }
        FilmDAO fd = new FilmDAO();

        if (action == null || action.equals("detail")) {
            getDetail(id, request, response, fd);
        } else if (action.equals("photo")) {
            getPhoto(id, request, response, fd);
        } else if (action.equals("cast")) {
            getCast(id, request, response, fd);
        } else if (action.equals("video")) {
            getVideo(id, request, response, fd);
        }

    }

    private void getDetail(int id, HttpServletRequest request, HttpServletResponse response, FilmDAO fd)
            throws ServletException, IOException {

        FilmDTO film = fd.getFilmDetailsById(id);

        RatingDAO dao = new RatingDAO();
        RatingDTO review = null;
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("authentication") != null) {
            AccountDTO account = (AccountDTO) session.getAttribute("authentication");
            int accountId = account.getId();

            review = dao.getRating(accountId, id);
            if (review == null) {
                if (dao.getFilmRating(id, false) != null && !dao.getFilmRating(id, false).isEmpty()) {
                    review = dao.getFilmRating(id, false).get(0);
                }
            }
        } else {
            if (dao.getFilmRating(id, false) != null && !dao.getFilmRating(id, false).isEmpty()) {
                review = dao.getFilmRating(id, false).get(0);
            }
        }

        PersonDAO pd = new PersonDAO();
        List<PersonDTO> cast = pd.getCastByFilm(id);

        List<String> genres = fd.getGenres(id);

        // get top 5 photo
        List<PhotoDTO> photos = fd.getNPhotosByFilmId(5,id);

        // get 3 video
        List<VideoDTO> videos = fd.getTopNVideosByFilm(3,id);
        for (VideoDTO v : videos) {
            v.setUrl(URLValidation.convertToEmbedLink(v.getUrl()));
        }

        request.setAttribute("cast", cast);
        request.setAttribute("film", film);
        if (review != null) {
            request.setAttribute("review", review);
        }
        request.setAttribute("photos", photos);
        request.setAttribute("videos", videos);
        request.setAttribute("genres", genres);

        RequestDispatcher rd = request.getRequestDispatcher(FILM_DETAIL);
        rd.forward(request, response);
    }

    private void getPhoto(int filmId, HttpServletRequest request, HttpServletResponse response, FilmDAO fd)
            throws ServletException, IOException {
        // get ALL photos by filmId
        FilmDTO film = fd.getFilmDetailsById(filmId);
        String poster = film.getPhoto();

        List<PhotoDTO> photos = fd.getNPhotosByFilmId(-1,filmId);
        request.setAttribute("main", poster);
        request.setAttribute("others", photos);
        request.setAttribute("type", 1);
        RequestDispatcher rd = request.getRequestDispatcher(GALLERY);
        rd.forward(request, response);
    }

    private void getCast(int filmId, HttpServletRequest request, HttpServletResponse response, FilmDAO fd) throws ServletException, IOException {
        // get ALL casts by filmId

    }

    private void getVideo(int filmId, HttpServletRequest request, HttpServletResponse response, FilmDAO fd) throws ServletException, IOException {
        // get ALL videos by filmID
        FilmDTO film = fd.getFilmDetailsById(filmId);
        String poster = film.getPhoto();

        List<VideoDTO> videos = fd.getAllVideosByFilm(filmId);
        for (VideoDTO v : videos) {
            v.setUrl(URLValidation.convertToEmbedLink(v.getUrl()));
        }
        request.setAttribute("main", poster);
        request.setAttribute("others", videos);
        request.setAttribute("type", 2);
        RequestDispatcher rd = request.getRequestDispatcher(GALLERY);
        rd.forward(request, response);
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

}
