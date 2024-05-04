/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.controllers.web;

import filmlovers.model.Film.FilmDAO;
import filmlovers.model.Film.FilmDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vothimaihoa
 */
public class FilmController extends HttpServlet {

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
        FilmDAO fd = new FilmDAO();
        String action = request.getParameter("action");
        // ko chon gi => mac dinh list
        if (action == null || action.equals("") || action.equals("list")) {
            getList(request, response, fd);
        }
    }

    /**
     * ***************************************************************************************************
     */
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
        FilmDAO fd = new FilmDAO();
        String action = request.getParameter("action");
        if (action == null || action.equals("")) {
            getList(request, response, fd);
        }
        
        
    }

    private void getList(HttpServletRequest request, HttpServletResponse response, FilmDAO fd)
            throws ServletException, IOException {
        String page_raw = request.getParameter("page");
        int page;
        if (page_raw == null || page_raw.trim().isEmpty()) {
            page = 1;
        }
        else  page = Integer.parseInt(page_raw);
        
        request.setAttribute("videos", fd.listVideo("approved", "send_at"));
        request.setAttribute("filmList", fd.list("approved",page,12)); 
        request.setAttribute("todayList", fd.getTodayList(12)); // get recent rated  today
        request.setAttribute("randomMovieList", fd.getRandomList(5, "movie")); // get 5 random movie
        request.setAttribute("randomSeriesList", fd.getRandomList(5, "series")); // get 5 random series
        RequestDispatcher rd = request.getRequestDispatcher("view/user/landing/landing.jsp");
        rd.forward(request, response);
    }

    /**
     * ***************************************************************************************************
     */
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
