/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.model.Account;

import java.sql.SQLException;

/**
 *
 * @author vothimaihoa
 */
public class AccountService {
    public static boolean isEmail(String email){
        email = email.trim();
        if (email.matches("^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$")) {
            return true;
        }
        return false;
    }
    
    public static boolean isValidEmail(String email)
            throws SQLException, ClassNotFoundException{
        if (email.matches(".*\\s.*")) {
            return false;
        } else {
            AccountDAO dao = new AccountDAO();
            AccountDTO account = null;
            
            account = dao.getAccountByEmail(email);
            if (account!=null) {
                return false;
            }
        }
        
        return true;
    }
    
    public static boolean isValidUsername(String username)
        throws SQLException, ClassNotFoundException{
        if (username.matches(".*\\s.*")) {
            return false;
        } else {
            AccountDAO dao = new AccountDAO();
            AccountDTO account = null;
            
            account = dao.getAccountByUsername(username);
            if (account!=null) {
                return false;
            }
        }
        
        return true;
    }
    
    
}
