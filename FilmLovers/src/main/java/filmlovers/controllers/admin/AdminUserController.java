/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.controllers.admin;

import filmlovers.model.Account.AccountDAO;
import filmlovers.model.Account.AccountDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
@WebServlet(name = "AdminUserController", urlPatterns = {"/admin/user"})
public class AdminUserController extends HttpServlet {
    private final String USER_LIST_VIEW = "/film-lovers/view/admin/list/userList.jsp";

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
        if (action == null || action.equals("") || action.equals("list")) {
            showList(request, response);
        } else if (action.equals("deactivate")) {
            deactivateUser(request, response);
        }
    }
    
    protected void showList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO dao = new AccountDAO();
        try {
            List<AccountDTO> list = dao.getAllAccount();
            request.setAttribute("userList", list);
            
            RequestDispatcher rd = request.getRequestDispatcher(USER_LIST_VIEW);
            rd.forward(request, response);
            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e){
            e.printStackTrace();
        }
    }

    protected void deactivateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO dao = new AccountDAO();
        String idRaw = request.getParameter("user-id");
        int id = 0;
        if (idRaw!=null && !idRaw.isEmpty()) {
            id = Integer.parseInt(idRaw);
        }
        
        boolean result = dao.deactivateAccountById(id);
        if (result) {
            showList(request, response);
            return;
        } else {
            request.setAttribute("error", "Can not deactivate this account");
        }
        
    }
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


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
