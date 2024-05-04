/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.model.Account;

import filmlovers.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vothimaihoa
 */
public class AccountDAO {

    public AccountDTO checkLogin(String username, String password, boolean admin)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        AccountDTO account = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT id, username, email, firstname, lastname, "
                        + " address, date_of_birth, isActive, image_link, role  "
                        + " FROM Account "
                        + " WHERE username = ? "
                        + " AND password = ? "
                        + " AND isActive = 1 ";
                if (admin) {
                    sql += " AND role = 'admin' ";
                }

                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);

                rs = stm.executeQuery();

                if (rs.next()) {
                    int id = rs.getInt("id");
                    String email = rs.getString("email");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String address = rs.getString("address");
                    Date dob = rs.getDate("date_of_birth");
                    String imgLink = rs.getString("image_link");
                    String role = rs.getString("role");

                    account = new AccountDTO(id, username, email, password, firstname, lastname, address, dob, true, imgLink, role);
                }
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return account;
    }

    public AccountDTO getAccountByUsername(String username)
            throws SQLException, ClassNotFoundException, IllegalArgumentException {
        AccountDTO account = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT id, username, email, firstname, lastname, "
                        + " address, date_of_birth, isActive, image_link, role  "
                        + " FROM Account "
                        + " WHERE username = ? ";

                stm = con.prepareStatement(sql);
                stm.setString(1, username);

                rs = stm.executeQuery();

                if (rs.next()) {
                    int id = rs.getInt("id");
                    String email = rs.getString("email");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String address = rs.getString("address");
                    Date dob = rs.getDate("date_of_birth");
                    boolean active = rs.getBoolean("isActive");
                    String imgLink = rs.getString("image_link");
                    String role = rs.getString("role");

                    account = new AccountDTO(id, username, email, null, firstname, lastname, address, dob, active, imgLink, role);

                }
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return account;
    }

    public AccountDTO getAccountById(int id)
            throws SQLException, ClassNotFoundException, IllegalArgumentException {
        AccountDTO account = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT id, username, email, firstname, lastname, "
                        + " address, date_of_birth, isActive, image_link, role  "
                        + " FROM Account "
                        + " WHERE id = ? ";

                stm = con.prepareStatement(sql);
                stm.setInt(1, id);

                rs = stm.executeQuery();

                if (rs.next()) {
                    String username = rs.getString("username");
                    String email = rs.getString("email");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String address = rs.getString("address");
                    Date dob = rs.getDate("date_of_birth");
                    boolean active = rs.getBoolean("isActive");
                    String imgLink = rs.getString("image_link");
                    String role = rs.getString("role");

                    account = new AccountDTO(id, username, email, null, firstname, lastname, address, dob, active, imgLink, role);

                }
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return account;
    }

    public AccountDTO getAccountByEmail(String email)
            throws SQLException, ClassNotFoundException, IllegalArgumentException {
        AccountDTO account = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT id, username, email, firstname, lastname, "
                        + " address, date_of_birth, isActive, image_link, role  "
                        + " FROM Account "
                        + " WHERE email = ? ";

                stm = con.prepareStatement(sql);
                stm.setString(1, email);

                rs = stm.executeQuery();

                if (rs.next()) {
                    int id = rs.getInt("id");
                    String username = rs.getString("username");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String address = rs.getString("address");
                    Date dob = rs.getDate("date_of_birth");
                    boolean active = rs.getBoolean("isActive");
                    String imgLink = rs.getString("image_link");
                    String role = rs.getString("role");

                    account = new AccountDTO(id, username, email, null, firstname, lastname, address, dob, active, imgLink, role);

                }
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return account;
    }

    public boolean insertAccount(AccountDTO account)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        int rowInserted;
        boolean result = false;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " INSERT INTO Account (username, email, password, "
                        + " firstname, lastname, address, "
                        + " date_of_birth, isActive, image_link, role) "
                        + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";

                stm = con.prepareStatement(sql);

                stm.setString(1, account.getUsername());
                stm.setString(2, account.getEmail());
                stm.setString(3, account.getPassword());
                stm.setString(4, account.getFirstName());
                stm.setString(5, account.getLastName());
                stm.setString(6, account.getAddress());
                stm.setDate(7, account.getDateOfBirth());
                stm.setBoolean(8, account.isActive());
                stm.setString(9, account.getImageURL());
                stm.setString(10, account.getRole());

                rowInserted = stm.executeUpdate();

                if (rowInserted > 0) {
                    result = true;
                }
            }

        } finally {

            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    public boolean updateAccount(AccountDTO account) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        int rowInserted;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " UPDATE Account "
                        + " SET firstname = ? , lastname = ? "
                        + " , address = ? , date_of_birth = ? , image_link = ? "
                        + " WHERE email = ? ";

                stm = con.prepareStatement(sql);

                stm.setString(1, account.getFirstName());
                stm.setString(2, account.getLastName());
                stm.setString(3, account.getAddress());
                stm.setDate(4, account.getDateOfBirth());
                stm.setString(5, account.getImageURL());
                stm.setString(6, account.getEmail());

                rowInserted = stm.executeUpdate();

                if (rowInserted > 0) {
                    return true;
                }
            }

        } finally {

            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return false;
    }

    public boolean setPassword(AccountDTO account, String newPassword)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " UPDATE Account "
                        + " SET password = ? "
                        + " WHERE username = ? ";

                stm = con.prepareStatement(sql);
                stm.setString(1, newPassword);
                stm.setString(2, account.getUsername());

                int rowCheck = stm.executeUpdate();

                if (rowCheck > 0) {
                    result = true;
                }
            }

        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    public boolean deactivateAccountById(int id) {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " UPDATE Account "
                        + " SET isActive = 'false' "
                        + " WHERE id = ? ";

                stm = con.prepareStatement(sql);
                stm.setInt(1, id);

                int rowCheck = stm.executeUpdate();

                if (rowCheck > 0) {
                    result = true;
                }
            }

            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return result;
    }
    public List<AccountDTO> getAllAccount()
            throws SQLException, ClassNotFoundException, IllegalArgumentException {
        List<AccountDTO> accountList = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT id, username, email, firstname, lastname, "
                        + " address, date_of_birth, isActive, image_link, role  "
                        + " FROM Account ";

                stm = con.prepareStatement(sql);

                rs = stm.executeQuery();

                while (rs.next()) {
                    String username = rs.getString("username");
                    int id = rs.getInt("id");
                    String email = rs.getString("email");
                    String firstname = rs.getString("firstname");
                    String lastname = rs.getString("lastname");
                    String address = rs.getString("address");
                    Date dob = rs.getDate("date_of_birth");
                    boolean active = rs.getBoolean("isActive");
                    String imgLink = rs.getString("image_link");
                    String role = rs.getString("role");

                    AccountDTO account = new AccountDTO(id, username, email, null, firstname, lastname, address, dob, active, imgLink, role);
                    accountList.add(account);
                }
            }

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return accountList;
    }

}
