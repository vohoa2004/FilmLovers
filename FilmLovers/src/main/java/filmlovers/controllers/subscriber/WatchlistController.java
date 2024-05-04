/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.controllers.subscriber;

import filmlovers.model.Account.AccountDTO;
import filmlovers.model.Film.FilmDTO;
import filmlovers.model.Playlist.PlaylistDAO;
import filmlovers.model.Playlist.PlaylistDTO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class WatchlistController extends HttpServlet {
    public static String PLAYLIST_VIEW_PAGE = "view/user/Watchlist/playlist.jsp";
    public static String WATCHLIST_VIEW_PAGE = "view/user/Watchlist/watchlist.jsp";
    public static String PLAYLIST_OPTIONS_PAGE = "view/user/Watchlist/playlistOptionsPage.jsp";
    public static String NEW_PLAYLIST_CREATION_PAGE = "view/user/Watchlist/playlistCreationForm.jsp";
 
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
        response.setContentType("text/html;charset=UTF-8");
        //catch params
        String action = request.getParameter("action");
        Integer filmID = null;
        Integer playlistID = null;
        try {
            filmID = Integer.parseInt(request.getParameter("filmID"));
            playlistID = Integer.parseInt(request.getParameter("playlistID"));
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        String playlistName = request.getParameter("playlistName");

        PlaylistDAO playlistDAO = new PlaylistDAO();
        if (action == null || action.equals("viewWatchlist")){
            viewWatchlist(request, response, playlistDAO);
        }
        else if(action.equals("choosePlaylist")){
            choosePlaylist(request, response, playlistDAO);
        }
        else if (action.equals("addToPlaylist")){
            addToPlaylist(request, response, playlistDAO, filmID, playlistID);
        }
        else if(action.equals("getNewPlaylistInfo")){
            getNewPlaylistInfo(request, response, filmID);
        }
        else if(action.equals("createNewPlaylistAndAddFilm")){  //clicked "Add" from PlaylistOptions page
            //insert new playlist to DB
            Integer newPlaylistID = createNewPlaylist(request, response, playlistDAO, playlistName);
            //call addToPlaylist
            if(newPlaylistID != null){
                addToPlaylist(request, response, playlistDAO, filmID, newPlaylistID);
            } else System.out.println("Error: Failed when inserting new playlist!");
        }
        else if (action.equals("createNewPlaylist")){   //clicked "Add" from Watchlist page
            //insert new playlist to DB
            Integer newPlaylistID = createNewPlaylist(request, response, playlistDAO, playlistName);
            //reload watchlist
            if(newPlaylistID != null){
                viewWatchlist(request, response, playlistDAO);
            } else System.out.println("Error: Failed when inserting new playlist!");
        }
        else if (action.equals("viewOnePlaylist")){
            viewOnePlaylist(request, response, playlistID, playlistDAO);
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
    
    private void choosePlaylist(HttpServletRequest request, HttpServletResponse response, PlaylistDAO playlistDAO) throws ServletException, IOException {
        String filmID = request.getParameter("filmID");
        HttpSession session = request.getSession(false);
        AccountDTO account = (AccountDTO) session.getAttribute("authentication");
        Integer accountID = 0;
        try {
            accountID = account.getId();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        List<PlaylistDTO> list =  playlistDAO.getAllPlaylistsByUserID(accountID);
        request.setAttribute("filmID", filmID);
        request.setAttribute("listOfPlaylists", list);
        request.getRequestDispatcher(PLAYLIST_OPTIONS_PAGE).forward(request, response);
    }
   
    private void addToPlaylist(HttpServletRequest request, HttpServletResponse response, PlaylistDAO playlistDAO, Integer filmID, Integer playlistID) throws ServletException, IOException {
        boolean status = playlistDAO.insertToFauvoriteFilmList(filmID, playlistID);
        if(status){
            List<FilmDTO> list =  playlistDAO.getAllMoviesFromPlaylist(playlistID);
            request.setAttribute("allMoviesOfPlaylist", list);
            request.getRequestDispatcher(PLAYLIST_VIEW_PAGE).forward(request, response);
        } 
        else System.out.println("Error: Failed when inserting item to favourite film table!");
    }

    private void getNewPlaylistInfo(HttpServletRequest request, HttpServletResponse response, Integer filmID) throws ServletException, IOException {
        String nextAction = "";
        if (filmID != null) {
            nextAction = "createNewPlaylistAndAddFilm";
        } else {
            nextAction = "createNewPlaylist";
        }
        request.setAttribute("filmID", filmID);
        request.setAttribute("nextAction", nextAction);
        request.getRequestDispatcher(NEW_PLAYLIST_CREATION_PAGE).forward(request, response);
    }
    
    
    private Integer createNewPlaylist(HttpServletRequest request, HttpServletResponse response, PlaylistDAO playlistDAO, String playlistName) {
        HttpSession session = request.getSession(false);
        AccountDTO account = (AccountDTO) session.getAttribute("authentication");
        int accountID = account.getId();
        Integer newPlaylistID = playlistDAO.insertNewPlaylist(playlistName, accountID);
        return newPlaylistID;
    }

    private void viewWatchlist(HttpServletRequest request, HttpServletResponse response, PlaylistDAO playlistDAO) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        AccountDTO account = (AccountDTO) session.getAttribute("authentication");
        Integer accountID = null;
        try {
            accountID = account.getId();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        //get all playlists of an account
        List<PlaylistDTO> list =  playlistDAO.getAllPlaylistsByUserID(accountID);
        request.setAttribute("listOfPlaylists", list);
        request.getRequestDispatcher(WATCHLIST_VIEW_PAGE).forward(request, response);
    }

    private void viewOnePlaylist(HttpServletRequest request, HttpServletResponse response, Integer playlistID, PlaylistDAO playlistDAO) throws ServletException, IOException {
        List<FilmDTO> list =  playlistDAO.getAllMoviesFromPlaylist(playlistID);
        request.setAttribute("allMoviesOfPlaylist", list);
        request.getRequestDispatcher(PLAYLIST_VIEW_PAGE).forward(request, response);
    }

}
