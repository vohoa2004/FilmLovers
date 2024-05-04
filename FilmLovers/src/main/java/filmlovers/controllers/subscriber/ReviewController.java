/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.controllers.subscriber;

import filmlovers.model.Account.AccountDTO;
import filmlovers.model.Film.FilmDAO;
import filmlovers.model.Film.FilmDTO;
import filmlovers.model.Rating.RatingDAO;
import filmlovers.model.Rating.RatingDTO;
import filmlovers.model.Review.ReviewDAO;
import filmlovers.model.Review.ReviewDTO;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
public class ReviewController extends HttpServlet {

    private final String LOGIN_PAGE = "login";
    private final String FILM_REVIEW_PAGE = "view/user/userReview/userReview.jsp";
    private final String ACCOUNT_REVIEW_PAGE = "view/user/accountReview/accountReview.jsp";
    private final String EDIT_REVIEW_PAGE = "view/user/popup/addReview/addReview.jsp";
    private final String REVIEW_DETAIL_PAGE = "";

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

        String action = request.getParameter("action");

        if (action == null || action.equals("") || action.equals("film-review")) {

            getFilmReview(request, response);

        } else if (action.equals("user-review")) {

            getUserReview(request, response);

        } else if (action.equals("add-review")) {
            addReview(request, response);
        } else if (action.equals("edit-review")) {
            editReview(request, response);
        } else if (action.equals("update-review")) {
            updateReview(request, response);
        } else if (action.equals("remove-review")) {
            //get where the user choose to remove the review, from film-detail or user-review?
            String origin = request.getParameter("origin");
            if (origin == null || origin.equals("")) {
                origin = "film";
            }
            deleteReview(request, response, origin);
        }
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
     * get list of all film reviews of a film
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void getFilmReview(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //how to get film-name/film-id from browser??
        int filmId = Integer.parseInt(request.getParameter("film-id"));
        String hideSpoilersStr = request.getParameter("hideSpoilers");
        boolean hideSpoiler = false;
        if (hideSpoilersStr!=null && !hideSpoilersStr.isEmpty()) {
            hideSpoiler = Boolean.parseBoolean(hideSpoilersStr);
        }

        String url = FILM_REVIEW_PAGE;

        RatingDAO rdao = new RatingDAO();

        List<RatingDTO> result = null;

        //if user has logged in & has reviewed the film -> their review show first
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("authentication") != null) {
            AccountDTO user = (AccountDTO) session.getAttribute("authentication");
            RatingDTO usersRating = rdao.getRating(filmId, user.getId());
            if (usersRating != null) {
                result=new ArrayList<>();
                result.addAll(rdao.getFilmRatingExcept(filmId, usersRating.getReview().getId(),hideSpoiler));
                result.add(0,usersRating);
            } else {
                result = rdao.getFilmRating(filmId,hideSpoiler);
            }
        } else {
            result = rdao.getFilmRating(filmId, hideSpoiler);
        }
        
        FilmDAO fdao = new FilmDAO();
        FilmDTO film = fdao.getFilmDetailsById(filmId);
        
        request.setAttribute("reviewList", result);
        request.setAttribute("film", film);
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    private void getUserReview(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //Check if user have logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("authentication") == null) {
            //url = LOGIN_PAGE;
            response.sendRedirect(LOGIN_PAGE);
            return;
        }
        AccountDTO account = (AccountDTO)session.getAttribute("authentication");
        String url = ACCOUNT_REVIEW_PAGE;

        RatingDAO dao = new RatingDAO();
        List<RatingDTO> result = null;
        result = dao.getUserRating(account.getId(),null);
        request.setAttribute("reviewList", result);
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    private void addReview(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        //Check if user have logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("authentication") == null) {
            //url = LOGIN_PAGE;
            response.sendRedirect(LOGIN_PAGE);
            return;
        }
        int filmId = Integer.parseInt(request.getParameter("film-id"));
        int accountId = Integer.parseInt(request.getParameter("account-id"));
        FilmDAO fdao = new FilmDAO();
        FilmDTO film = fdao.getFilmDetailsById(filmId);
        String url = EDIT_REVIEW_PAGE;

        //check if user already review, if yes -> forward to review detail, if no -> forward to edit screen to add review
        RatingDAO dao = new RatingDAO();
        RatingDTO review = dao.getRating(accountId, filmId);
        if (review == null) {
            review = new RatingDTO();
            ReviewDTO reviewContent = new ReviewDTO();
            reviewContent.setAccountId(accountId);
            reviewContent.setFilmTitle(film.getTitle());
            reviewContent.setFilmId(filmId);
            review.setAccountId(accountId);
            review.setReview(reviewContent);
            review.setFilmId(filmId);
        } 
        request.setAttribute("review", review);
        request.setAttribute("film", film);

        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    
    private void editReview(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //Check if user have logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("authentication") == null) {
            //url = LOGIN_PAGE;
            response.sendRedirect(LOGIN_PAGE);
            return;
        }

        int filmId = Integer.parseInt(request.getParameter("film-id"));
        int accountId = Integer.parseInt(request.getParameter("account-id"));
        String url = EDIT_REVIEW_PAGE;

        RatingDAO dao = new RatingDAO();
        RatingDTO review = dao.getRating(accountId, filmId);

        request.setAttribute("review", review);
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    
    private void updateReview(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int filmId = Integer.parseInt(request.getParameter("film-id"));
        int accountId = Integer.parseInt(request.getParameter("account-id"));
        String url = EDIT_REVIEW_PAGE;
        
        int score = Integer.parseInt(request.getParameter("score"));

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        content = content.replace("\r\n", "<br />\r\n");
        boolean spoiler = Integer.parseInt(request.getParameter("spoilers")) == 1 ? true : false;

        //get if this is editing or adding review
        RatingDAO dao = new RatingDAO();
        RatingDTO originReview = dao.getRating(accountId, filmId);

        boolean result = false;

        if (originReview != null) {
            Date sendDate = Date.valueOf(LocalDate.now());
            originReview.setScore(score);
            originReview.setRateDate(sendDate);
            originReview.getReview().setTitle(title);
            originReview.getReview().setContent(content);
            originReview.getReview().setSpoiler(spoiler);
            originReview.getReview().setSendDate(sendDate);
            result = dao.editRating(originReview);
        } else {
            //if a new review, set sendDate
            Date sendDate = Date.valueOf(LocalDate.now());
            ReviewDTO newReview = new ReviewDTO(0, title, content, spoiler, sendDate, filmId, accountId);
            RatingDTO newRating = new RatingDTO(accountId, filmId, score, sendDate, 0, newReview);
            result = dao.addRatingWithReview(newRating);
        }

        if (result) {
            request.setAttribute("review", dao.getRating(accountId, filmId));
            getFilmReview(request, response);
            return;
        } else {
            request.setAttribute("reviewError", "Something went wrong, please try again later.");
        }
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    private void deleteReview(HttpServletRequest request, HttpServletResponse response, String origin)
            throws ServletException, IOException {

        //Check if user have logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("authentication") == null) {
            //url = LOGIN_PAGE;
            response.sendRedirect(LOGIN_PAGE);
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        int reviewId = Integer.parseInt(request.getParameter("review-id"));
        String url = FILM_REVIEW_PAGE;
        boolean result = false;

        ReviewDAO dao = new ReviewDAO();
        result = dao.deleteReview(reviewId);
        if (result) {
            url = origin.equals("film") ? FILM_REVIEW_PAGE : ACCOUNT_REVIEW_PAGE;
        } else {
            request.setAttribute("reviewError", "Can not remove this review. Please try again later.");
        }
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
