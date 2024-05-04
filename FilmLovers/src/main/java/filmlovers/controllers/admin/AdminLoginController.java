/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.controllers.admin;

import filmlovers.model.Account.AccountDAO;
import filmlovers.model.Account.AccountDTO;
import filmlovers.utils.HashingEncryptor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class AdminLoginController extends HttpServlet {

    private final String LOGIN_INVALID_PAGE = "/view/admin/signIn.jsp";
    private final String LOGIN_SUCCESSFULLY_PAGE = "/film-lovers/admin/film";

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
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        if (!action.equals("logout")) {
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("authentication") != null) {
                response.sendRedirect(LOGIN_SUCCESSFULLY_PAGE);
                return;
            }
        } else if (action.equals("logout")) {
            logout(request, response);
            return;
        }
        RequestDispatcher rd = request.getRequestDispatcher(LOGIN_INVALID_PAGE);
        rd.forward(request, response);
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
        if (action == null || action.equals("") || action.equals("login")) {
            
            login(request, response);
        }  else if (action.equals("logout")) {
            logout(request, response);
        }
    }

    protected void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = request.getParameter("page");
        if (url == null || url.isEmpty()) {
            url = LOGIN_INVALID_PAGE;
        }
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
            request.setAttribute("errorMsg", "Log out successfully");
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    
    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = LOGIN_INVALID_PAGE;

        String username = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");

        if (password == null) {
            String errorMsg = "Incorrect username or password. Please try again!";
            request.setAttribute("errorMsg", errorMsg);

            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        } else {
            password = HashingEncryptor.getEncryptedHexa(password);

            try {
                AccountDAO accountDAO = new AccountDAO();
                AccountDTO account = accountDAO.checkLogin(username, password, true);

                if (account!=null) {
                    url = LOGIN_SUCCESSFULLY_PAGE;

                    //open user's session
                    HttpSession session = request.getSession();
                    session = request.getSession(true);
                    session.setAttribute("authentication", account);
                    response.sendRedirect(url);
                } else {
                    String errorMsg = "Incorrect username or password. Please try again!";
                    request.setAttribute("loginError", errorMsg);
                    RequestDispatcher rd = request.getRequestDispatcher(url);
                    rd.forward(request, response);
                }

            } catch (SQLException e) {
                System.out.println("Database Error. Details: " + e.getMessage());
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                System.out.println("Driver Error. Details: " + e.getMessage());
                e.printStackTrace();
            }
        }
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
