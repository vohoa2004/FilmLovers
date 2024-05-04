package filmlovers.controllers.web;

import filmlovers.model.Film.FilmDAO;
import filmlovers.model.Film.FilmDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchFilmController extends HttpServlet {
    
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
        
        int lastFilmId = parseIntParam(request, "lastFilmId");
        String title = request.getParameter("title");
        
        int releaseYearFrom = parseIntParam(request, "releaseYearFrom");
        int releaseYearTo = parseIntParam(request, "releaseYearTo");
        String country = request.getParameter("country");
        String language = request.getParameter("language");
        String type = request.getParameter("type");
        
        List<String> genres = new ArrayList<>();
        String[] genres_raw = request.getParameterValues("genres");
        if (genres_raw != null) {
            genres = Arrays.asList(genres_raw);
        }
        
        List<String> keywords = new ArrayList<>();
        String[] keywords_raw = request.getParameterValues("keywords");
        if (keywords_raw != null) {
            keywords = Arrays.asList(keywords_raw);
        }
        
        int runtimeFrom = parseIntParam(request, "runtimeFrom");
        int runtimeTo = parseIntParam(request, "runtimeTo");
        
        FilmDAO filmDAO = new FilmDAO();

        // get list of product for this page
        List<FilmDTO> films;
        films = filmDAO.searchByFilter(title, lastFilmId, releaseYearFrom,
                releaseYearTo, country, language, type, genres, runtimeFrom, runtimeTo, keywords, FILMS_PER_PAGE);

        if (films.isEmpty()) {
            request.setAttribute("message", "No movies matches your searching");
        }else {
        // set attributes
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
        
        request.setAttribute("searchFilms", films);}
        
        request.getRequestDispatcher("/view/user/filter/filter.jsp").forward(request, response);
    }

//***************************************************************************************************************

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response); 
    }
    
//***************************************************************************************************************
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
