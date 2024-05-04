/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.controllers.subscriber;

import filmlovers.model.Account.AccountDAO;
import filmlovers.model.Account.AccountDTO;
import filmlovers.model.Account.AccountService;
import filmlovers.utils.HashingEncryptor;
import java.io.IOException;
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
public class LoginController extends HttpServlet {

    private final String LOGIN_INVALID_PAGE = "view/user/login/login.jsp";
    private final String LOGIN_SUCCESSFULLY_PAGE = "film";
    private final String INFO_INPUT_PAGE = "view/user/editProfile/editProfileDetail.jsp";
    private final String ADMIN_PAGE = "/film-lovers/admin/film";

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
        if (action==null) {
            action="";
        }
        if (!action.equals("logout")) {
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("authentication") != null) {
                response.sendRedirect(LOGIN_SUCCESSFULLY_PAGE);
                return;
            }
        } else if (action.equals("logout"))  {
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
        } else if (action.equals("signup")) {
            
            signup(request, response);
        } else if (action.equals("logout")) {
            logout(request, response);
        } else if (action.equals("createAccount")) {
            createAccount(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
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
                AccountDTO account = accountDAO.checkLogin(username, password, false);

                if (account!=null) {
                    url = LOGIN_SUCCESSFULLY_PAGE;

                    //open user's session
                    HttpSession session = request.getSession();
                    session.setAttribute("authentication", account);
                    
                    if (account.getRole().equals("admin")) {
                        url = ADMIN_PAGE;
                    }
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

    protected void signup(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String url = LOGIN_INVALID_PAGE;

        String email = request.getParameter("txtEmail");

        try {
            if (!AccountService.isValidEmail(email)) {
                request.setAttribute("signupInvalidMsg", "This email is already in use. <br> Try logging in or using another email!");
            } else {
                url = LOGIN_INVALID_PAGE;
                request.setAttribute("signupNextStep", "");
                
            }
            request.setAttribute("email", email);
            request.setAttribute("action", "signup");

        } catch (SQLException e) {
            System.out.println("Database Error. Details: " + e.getMessage());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            System.out.println("Driver Error. Details: " + e.getMessage());
            e.printStackTrace();
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    protected void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = request.getParameter("page");
        if (url==null || url.isEmpty()) {
            url = LOGIN_INVALID_PAGE;
        }
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
            //request.setAttribute("errorMsg", "Log out successfully");
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }
    
    protected void createAccount(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String url = LOGIN_INVALID_PAGE;

        String email = request.getParameter("txtEmail");
        String username = request.getParameter("txtUsername");

        try {
            if (!AccountService.isValidUsername(username)) {
                request.setAttribute("signupInvalidMsg", "This username is already in use. <br> Try logging in or using another email!");
                request.setAttribute("signupNextStep", "");
            } else {
                String password = request.getParameter("txtPassword");
                AccountDTO account = new AccountDTO();
                account.setEmail(email);
                account.setUsername(username);
                account.setPassword(HashingEncryptor.getEncryptedHexa(password));
                url = INFO_INPUT_PAGE;
                request.setAttribute("account", account);
                
            }

        } catch (SQLException e) {
            System.out.println("Database Error. Details: " + e.getMessage());
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            System.out.println("Driver Error. Details: " + e.getMessage());
            e.printStackTrace();
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
