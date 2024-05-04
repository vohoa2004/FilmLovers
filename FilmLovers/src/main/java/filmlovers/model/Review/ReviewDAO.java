/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.model.Review;

import filmlovers.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vothimaihoa
 */
public class ReviewDAO {

    public List<ReviewDTO> listFilmReview(int filmId) {
        List<ReviewDTO> list = new ArrayList<ReviewDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = " SELECT A.id, A.title, A.content, "
                    + " A.send_at, A.is_spoiler, A.film_id, B.title as 'film_title' "
                    + " ,A.account_id, C.username "
                    + " FROM Review A left outer join "
                    + "	(SELECT id as 'film_id', title FROM Film) B on A.film_id = B.film_id "
                    + "	left outer join	(SELECT id as 'account_id', username FROM Account) C on A.account_id = C.account_id "
                    + " WHERE A.film_id = ? ";
            PreparedStatement stm = con.prepareStatement(sql);

            stm.setInt(1, filmId);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                ReviewDTO review = new ReviewDTO();
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                Date sendDate = rs.getDate("send_at");
                boolean spoiler = rs.getBoolean("is_spoiler");
                int accountId = rs.getInt("account_id");
                String filmTitle = rs.getString("film_title");
                String username = rs.getString("username");

                review.setId(id);
                review.setTitle(title);
                review.setContent(content);
                review.setSendDate(sendDate);
                review.setSpoiler(spoiler);
                review.setFilmId(filmId);
                review.setAccountId(accountId);
                review.setFilmTitle(filmTitle);
                review.setUsername(username);

                list.add(review);
            }
        } catch (SQLException e) {
            System.out.println("SQL exception: ");
            e.printStackTrace();
        }
        return list;
    }

    public List<ReviewDTO> listFilmReviewExcept(int filmId, int reviewId) {
        List<ReviewDTO> list = new ArrayList<ReviewDTO>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = " SELECT A.id, A.title, A.content, "
                    + " A.send_at, A.is_spoiler, A.film_id, B.title as 'film_title' "
                    + " ,A.account_id, C.username "
                    + " FROM Review A left outer join "
                    + "	(SELECT id as 'film_id', title FROM Film) B on A.film_id = B.film_id "
                    + "	left outer join	(SELECT id as 'account_id', username FROM Account) C on A.account_id = C.account_id "
                    + " WHERE A.film_id = ? AND (A.id < ? OR A.id > ?) ";
            PreparedStatement stm = con.prepareStatement(sql);

            stm.setInt(1, filmId);
            stm.setInt(2, reviewId);
            stm.setInt(3, reviewId);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                ReviewDTO review = new ReviewDTO();
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                Date sendDate = rs.getDate("send_at");
                boolean spoiler = rs.getBoolean("is_spoiler");
                int accountId = rs.getInt("account_id");
                String filmTitle = rs.getString("film_title");
                String username = rs.getString("username");

                review.setId(id);
                review.setTitle(title);
                review.setContent(content);
                review.setSendDate(sendDate);
                review.setSpoiler(spoiler);
                review.setFilmId(filmId);
                review.setAccountId(accountId);
                review.setFilmTitle(filmTitle);
                review.setUsername(username);

                list.add(review);
            }
        } catch (SQLException e) {
            System.out.println("SQL exception: ");
            e.printStackTrace();
        }
        return list;
    }

    public List<ReviewDTO> listUserReview(int accountId) {
        List<ReviewDTO> list = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " SELECT A.id, A.title, A.content, "
                        + " A.send_at, A.is_spoiler, A.film_id, B.title as 'film_title' "
                        + " ,A.account_id, C.username "
                        + " FROM Review A left outer join "
                        + "	(SELECT id as 'film_id', title FROM Film) B on A.film_id = B.film_id "
                        + "	left outer join	(SELECT id as 'account_id', username FROM Account) C on A.account_id = C.account_id "
                        + " WHERE A.account_id = ? ";

                stm = con.prepareStatement(sql);
                stm.setInt(1, accountId);

                rs = stm.executeQuery();

                while (rs.next()) {
                    ReviewDTO review = null;

                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    Date sendDate = rs.getDate("send_at");
                    boolean spoiler = rs.getBoolean("is_spoiler");
                    int filmId = rs.getInt("film_id");
                    String filmTitle = rs.getString("film_title");
                    String username = rs.getString("username");

                    review = new ReviewDTO(id, title, content, spoiler, sendDate, filmId, accountId);
                    review.setFilmTitle(filmTitle);
                    review.setUsername(username);
                    list.add(review);
                }

            }
            DBUtils.closeConnection(con);
        } catch (SQLException e) {
            System.out.println("SQL exception: ");
            e.printStackTrace();
        }

        return list;
    }

    public boolean addReview(ReviewDTO review) {
        Connection con = null;
        PreparedStatement stm = null;
        int rowInserted;
        boolean result = false;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " INSERT INTO Review (title, content, is_spoiler, film_id, account_id) "
                        + " VALUES(?,?,?,?,?) ";

                stm = con.prepareStatement(sql);

                stm.setString(1, review.getTitle());
                stm.setString(2, review.getContent());
                stm.setBoolean(3, review.isSpoiler());
                stm.setInt(4, review.getFilmId());
                stm.setInt(5, review.getAccountId());

                rowInserted = stm.executeUpdate();

                if (rowInserted > 0) {
                    result = true;
                }
            }
            DBUtils.closeConnection(con);
        } catch (SQLException e) {
            System.out.println("SQL exception: ");
            e.printStackTrace();
        }

        return result;
    }

    public boolean editReview(ReviewDTO review) {
        Connection con = null;
        PreparedStatement stm = null;
        int rowInserted;
        boolean result = false;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " UPDATE Review "
                        + " SET title = ?, content = ?, is_spoiler = ? "
                        + " WHERE id = ? ";

                stm = con.prepareStatement(sql);

                stm.setString(1, review.getTitle());
                stm.setString(2, review.getContent());
                stm.setBoolean(3, review.isSpoiler());
                stm.setInt(4, review.getId());

                rowInserted = stm.executeUpdate();

                if (rowInserted > 0) {
                    result = true;
                }
            }

            DBUtils.closeConnection(con);
        } catch (SQLException e) {
            System.out.println("SQL exception: ");
            e.printStackTrace();
        }

        return result;
    }

    public boolean deleteReview(int id) {
        Connection con = null;
        PreparedStatement stm = null;
        int rowInserted;
        boolean result = false;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " DELETE Review "
                        + " WHERE id = ? ";

                stm = con.prepareStatement(sql);

                stm.setInt(1, id);

                rowInserted = stm.executeUpdate();

                if (rowInserted > 0) {
                    result = true;
                }
            }

            DBUtils.closeConnection(con);
        } catch (SQLException e) {
            System.out.println("SQL exception: ");
            e.printStackTrace();
        }

        return result;
    }

    //Get an account's review for a specific film
    public ReviewDTO getReview(int accountId, int filmId) {
        ReviewDTO result = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " SELECT A.id, A.title, A.content, "
                    + " A.send_at, A.is_spoiler, A.film_id, B.title as 'film_title' "
                    + " ,A.account_id, C.username "
                    + " FROM Review A left outer join "
                    + "	(SELECT id as 'film_id', title FROM Film) B on A.film_id = B.film_id "
                    + "	left outer join	(SELECT id as 'account_id', username FROM Account) C on A.account_id = C.account_id "
                    + " WHERE A.film_id = ? AND A.account_id = ? ";

                stm = con.prepareStatement(sql);
                stm.setInt(1, filmId);
                stm.setInt(2, accountId);

                rs = stm.executeQuery();

                if (rs.next()) {
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
                    String content = rs.getString("content");
                    Date sendDate = rs.getDate("send_at");
                    boolean spoiler = rs.getBoolean("is_spoiler");
                    String filmTitle = rs.getString("film_title");
                    String username = rs.getString("username");

                    result = new ReviewDTO(id, title, content, spoiler, sendDate, filmId, accountId);
                    result.setFilmTitle(filmTitle);
                    result.setUsername(username);
                }
            }

            DBUtils.closeConnection(con);
        } catch (SQLException e) {
            System.out.println("SQL exception: ");
            e.printStackTrace();
        }

        return result;
    }

}
