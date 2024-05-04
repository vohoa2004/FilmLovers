/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.controllers.subscriber;

import filmlovers.model.Account.AccountDAO;
import filmlovers.model.Account.AccountDTO;
import filmlovers.model.Film.FilmDTO;
import filmlovers.model.Playlist.FavouriteFilmDTO;
import filmlovers.model.Playlist.PlaylistDAO;
import filmlovers.model.Playlist.PlaylistDTO;
import filmlovers.model.Rating.RatingDAO;
import filmlovers.model.Rating.RatingDTO;
import filmlovers.utils.HashingEncryptor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class AccountDetailController extends HttpServlet {

    private final String LANDING_PAGE = "film";
    private final String USER_PROFILE = "view/user/viewProfile/viewProfile.jsp";
    private final String LOGIN_PAGE = "view/user/login/login.jsp";
    private final String INFO_INPUT_PAGE = "view/user/editProfile/editProfileDetail.jsp";

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
        if (action == null || action.equals("") || action.equals("get-info")) {
            String rawId = request.getParameter("id");
            if (rawId == null) {
                getInfo(request, response);
            } else {
                try {
                    Integer id = Integer.parseInt(rawId);
                    getInfo(request, response, id);
                } catch (ClassNotFoundException ex) {
                    Logger.getLogger(AccountDetailController.class.getName()).log(Level.SEVERE, null, ex);
                } catch (SQLException ex) {
                    Logger.getLogger(AccountDetailController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } else if (action.equals("update-info")) {
            updateInfo(request, response);
        } else if (action.equals("edit-info")) {
            editInfo(request, response);
        }
    }

    protected void getInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("authentication") == null) {
            response.sendRedirect(LOGIN_PAGE);
            return;
        }
        AccountDTO account = (AccountDTO) session.getAttribute("authentication");
        AccountDAO dao = new AccountDAO();

        //RATING
        RatingDAO rdao = new RatingDAO();
        List<RatingDTO> ratingList = rdao.getUserRating(account.getId(), "rated_at");

        //PLAYLIST
        PlaylistDAO pdao = new PlaylistDAO();
        List<PlaylistDTO> playlists = pdao.getAllPlaylistsByUserID(account.getId());

        //FROM UR WATCHLIST
        if (!playlists.isEmpty()) {
            List<FilmDTO> favFilms = pdao.getAllMoviesFromPlaylist(playlists.get(0).getId());
            request.setAttribute("favFilms", favFilms);
        }

        //REVIEW
        request.setAttribute("user", account);
        request.setAttribute("ratingList", ratingList);
        request.setAttribute("playlists", playlists);
        

        RequestDispatcher rd = request.getRequestDispatcher(USER_PROFILE);
        rd.forward(request, response);

    }

    protected void getInfo(HttpServletRequest request, HttpServletResponse response, int id)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("authentication") == null) {
            response.sendRedirect(LOGIN_PAGE);
            return;
        }
        AccountDAO dao = new AccountDAO();
        AccountDTO account = dao.getAccountById(id);

        //RATING
        RatingDAO rdao = new RatingDAO();
        List<RatingDTO> ratingList = rdao.getUserRating(id, "rated_at");

        //PLAYLIST
        PlaylistDAO pdao = new PlaylistDAO();
        List<PlaylistDTO> playlists = pdao.getAllPlaylistsByUserID(id);

        //FROM UR WATCHLIST
        List<FilmDTO> favFilms = pdao.getAllMoviesFromPlaylist(playlists.get(0).getId());

        //REVIEW
        request.setAttribute("user", account);
        request.setAttribute("ratingList", ratingList);
        request.setAttribute("playlists", playlists);
        request.setAttribute("favFilms", favFilms);

        RequestDispatcher rd = request.getRequestDispatcher(USER_PROFILE);
        rd.forward(request, response);

    }

    protected void editInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("authentication") == null) {
            response.sendRedirect(LOGIN_PAGE);
            return;
        }
        AccountDTO account = (AccountDTO) session.getAttribute("authentication");
        request.setAttribute("account", account);

        RequestDispatcher rd = request.getRequestDispatcher(INFO_INPUT_PAGE);
        rd.forward(request, response);
    }

    protected void updateInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String email = request.getParameter("txtEmail");
        String url = INFO_INPUT_PAGE;
        HttpSession session = request.getSession(false);
        boolean status = false;

        try {
            //If an old user update their info
            if (session != null && session.getAttribute("authentication") != null) {
                AccountDAO dao = new AccountDAO();
                AccountDTO account = dao.getAccountByEmail(email);

                String firstName = request.getParameter("txtFirstName");
                String lastName = request.getParameter("txtLastName");
                String address = request.getParameter("address");
                String date = request.getParameter("date");
                String month = request.getParameter("month");
                String year = request.getParameter("year");
                Date dateOfBirth = null;
                if (date != null && month != null && year != null) {
                    String dobRaw = year + "-" + month + "-" + date;
                    dateOfBirth = Date.valueOf(dobRaw);
                }
                String imageURL = request.getParameter("image");

                account.setFirstName(firstName != null ? firstName : account.getFirstName());
                account.setLastName(lastName != null ? lastName : account.getLastName());
                account.setAddress(address != null ? address : account.getAddress());
                account.setDateOfBirth(dateOfBirth);
                account.setImageURL(imageURL);

                status = dao.updateAccount(account);
                if (status) {
                    session.setAttribute("authentication", account);

                    /*When update successfully, reload the page  
                    with their new info*/
                }
            } //When a new user set their info
            else {
                AccountDAO dao = new AccountDAO();
                AccountDTO account = new AccountDTO();

                String username = request.getParameter("txtUsername");
                String password = request.getParameter("txtPassword");
                String firstName = request.getParameter("txtFirstName");
                String lastName = request.getParameter("txtLastName");
                String address = request.getParameter("address");

                String date = request.getParameter("date");
                String month = request.getParameter("month");
                String year = request.getParameter("year");
                Date dateOfBirth = null;
                if (date != null && month != null && year != null) {
                    String dobRaw = year + "-" + month + "-" + date;
                    dateOfBirth = Date.valueOf(dobRaw);
                }

                String imageURL = request.getParameter("image");

                account.setEmail(email);
                account.setUsername(username);
                account.setPassword(password);
                account.setFirstName(firstName);
                account.setLastName(lastName);
                account.setAddress(address);
                account.setDateOfBirth(dateOfBirth);
                account.setImageURL(imageURL);
                account.setRole("user");
                account.setActive(true);

                status = dao.insertAccount(account);
                if (status) {
                    session = request.getSession(true);
                    session.setAttribute("authentication", dao.getAccountByUsername(account.getUsername()));
                    url = LANDING_PAGE;
                    response.sendRedirect(url);
                    return;
                }
            }
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);

        } catch (SQLException e) {
            System.out.println("Database Error. Details: " + e.getMessage());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            System.out.println("Driver Error. Details: " + e.getMessage());
            e.printStackTrace();
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
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
