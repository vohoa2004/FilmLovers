/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.model.Rating;

import filmlovers.model.Film.FilmDTO;
import filmlovers.model.Review.ReviewDTO;
import filmlovers.utils.DBUtils;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author vothimaihoa
 */
public class RatingDAO {

    public List<RatingDTO> getFilmRating(int filmId, boolean hideSpoilers) {
        List<RatingDTO> ratingList = new ArrayList<>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = " SELECT  A.[film_id], B.film_title, A.[score],A.[rated_at],B.id as 'review_id', "
                    + "	B.title, B.content, B.is_spoiler, B.send_at, A.[account_id], B.username "
                    + " FROM Rating A left outer join "
                    + "	(SELECT A.id, A.title, A.content, "
                    + "	A.send_at, A.is_spoiler, B.title as 'film_title', C.username "
                    + "	FROM Review A join "
                    + "	(SELECT id as 'film_id', title FROM Film WHERE id = ?) B on A.film_id = B.film_id "
                    + "	join"
                    + "	(SELECT id as 'account_id', username FROM Account) C on A.account_id = C.account_id "
                    + "	WHERE A.film_id = ?) B on A.review_id = B.id "
                    + " WHERE A.[film_id] = ? ";

            if (hideSpoilers) {
                sql += " AND is_spoilers = 0 ";
            }
            PreparedStatement stm = con.prepareStatement(sql);

            stm.setInt(1, filmId);
            stm.setInt(2, filmId);
            stm.setInt(3, filmId);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int accountId = rs.getInt("account_id");
                String username = rs.getString("username");
                String filmTitle = rs.getString("film_title");
                int reviewId = rs.getInt("review_id");
                int score = rs.getInt("score");
                Date rateDate = rs.getDate("rated_at");
                Date reviewDate = rs.getDate("send_at");
                String title = rs.getString("title");
                String content = rs.getString("content");
                boolean spoiler = rs.getBoolean("is_spoiler");

                ReviewDTO review = new ReviewDTO(reviewId, title, content, reviewDate, spoiler, filmId, accountId, filmTitle, username);
                RatingDTO rating = new RatingDTO(accountId, filmId, score, rateDate, reviewId, review);

                ratingList.add(rating);
            }
            DBUtils.closeConnection(con);
        } catch (SQLException e) {
            System.out.println("SQL exception: ");
            e.printStackTrace();
        }

        return ratingList;
    }

    public List<RatingDTO> getFilmRatingExcept(int filmId, int reviewEx, boolean hideSpoilers) {
        List<RatingDTO> ratingList = new ArrayList<>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = " SELECT  A.[film_id], B.film_title, A.[score],A.[rated_at],B.id as 'review_id', "
                    + "	B.title, B.content, B.is_spoiler, B.send_at, A.[account_id], B.username "
                    + " FROM Rating A left outer join "
                    + "	(SELECT A.id, A.title, A.content, "
                    + "	A.send_at, A.is_spoiler, B.title as 'film_title', C.username "
                    + "	FROM Review A join "
                    + "	(SELECT id as 'film_id', title FROM Film WHERE id = ?) B on A.film_id = B.film_id "
                    + "	join"
                    + "	(SELECT id as 'account_id', username FROM Account) C on A.account_id = C.account_id "
                    + "	WHERE A.film_id = ?) B on A.review_id = B.id "
                    + " WHERE A.[film_id] = ? AND (A.review_id < ? OR A.review_id > ?) ";
            if (hideSpoilers) {
                sql += " AND is_spoilers = 0 ";
            }

            PreparedStatement stm = con.prepareStatement(sql);

            stm.setInt(1, filmId);
            stm.setInt(2, filmId);
            stm.setInt(3, filmId);
            stm.setInt(4, reviewEx);
            stm.setInt(5, reviewEx);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int accountId = rs.getInt("account_id");
                String username = rs.getString("username");
                String filmTitle = rs.getString("film_title");
                int reviewId = rs.getInt("review_id");
                int score = rs.getInt("score");
                Date rateDate = rs.getDate("rated_at");
                Date reviewDate = rs.getDate("send_at");
                String title = rs.getString("title");
                String content = rs.getString("content");
                boolean spoiler = rs.getBoolean("is_spoiler");

                ReviewDTO review = new ReviewDTO(reviewId, title, content, reviewDate, spoiler, filmId, accountId, filmTitle, username);
                RatingDTO rating = new RatingDTO(accountId, filmId, score, rateDate, reviewId, review);

                ratingList.add(rating);
            }
            DBUtils.closeConnection(con);
        } catch (SQLException e) {
            System.out.println("SQL exception: ");
            e.printStackTrace();
        }

        return ratingList;
    }

    public List<RatingDTO> getUserRating(int accountId, String sortBy) {
        List<RatingDTO> ratingList = new ArrayList<>();
        try {

            Connection con = DBUtils.getConnection();
            String sql = " SELECT  A.[film_id], B.film_title, A.[score],A.[rated_at], "
                    + " B.id as 'review_id', B.release_year, B.photo as 'film_photo', B.type as 'film_type',  "
                    + " B.title, B.content, B.is_spoiler, A.[account_id], B.username "
                    + " FROM Rating A left outer join  "
                    + "	(SELECT A.id, A.title, A.content, B.release_year, B.photo,B.type, "
                    + "	A.send_at, A.is_spoiler, B.title as 'film_title', C.username  "
                    + "	FROM Review A join "
                    + "	(SELECT id as 'film_id', release_year, photo, type, title FROM Film) B on A.film_id = B.film_id  "
                    + "	join (SELECT id as 'account_id', username FROM Account WHERE id = ?) C on A.account_id = C.account_id  "
                    + " WHERE A.account_id = ?) B on A.review_id = B.id "
                    + " WHERE A.account_id = ? ";

            if (sortBy != null && !sortBy.isEmpty()) {
                sql += "ORDER BY A." + sortBy + " desc ";
            }
            PreparedStatement stm = con.prepareStatement(sql);

            stm.setInt(1, accountId);
            stm.setInt(2, accountId);
            stm.setInt(3, accountId);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                int filmId = rs.getInt("film_id");
                String username = rs.getString("username");
                String filmTitle = rs.getString("film_title");
                int reviewId = rs.getInt("review_id");
                int score = rs.getInt("score");
                Date rateDate = rs.getDate("rated_at");
                String title = rs.getString("title");
                String content = rs.getString("content");
                boolean spoiler = rs.getBoolean("is_spoiler");
                int releaseYear = rs.getInt("release_year");
                String photo = rs.getString("film_photo");
                String type = rs.getString("film_type");
                
                FilmDTO film = new FilmDTO();
                film.setId(filmId);
                film.setTitle(filmTitle);
                film.setReleaseYear(releaseYear);
                film.setPhoto(photo);
                film.setType(type);
                ReviewDTO review = new ReviewDTO(reviewId, title, content, rateDate, spoiler, filmId, accountId, filmTitle, username);
                RatingDTO rating = new RatingDTO(accountId, filmId, score, rateDate, reviewId, review);
                rating.setFilm(film);
                
                ratingList.add(rating);
            }
            DBUtils.closeConnection(con);
        } catch (SQLException e) {
            System.out.println("SQL exception: ");
            e.printStackTrace();
        }

        return ratingList;
    }

    public float avgRating(int filmId) {
        float rating = 0;
        try {

            Connection con = DBUtils.getConnection();
            String sql = " SELECT AVG(Cast(score as Float)) as 'avg' "
                    + " FROM Rating "
                    + " WHERE film_id=? ";

            PreparedStatement stm = con.prepareStatement(sql);

            stm.setInt(1, filmId);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                rating = rs.getFloat("avg");
            }
            DBUtils.closeConnection(con);
        } catch (SQLException e) {
            System.out.println("SQL exception: ");
            e.printStackTrace();
        }
        return rating;
    }

    public RatingDTO getRating(int accountId, int filmId) {
        RatingDTO rating = null;
        try {

            Connection con = DBUtils.getConnection();
            String sql = " SELECT  A.[film_id], B.film_title, A.[score],A.[rated_at],B.id as 'review_id', "
                    + "	B.title, B.content, B.is_spoiler, B.send_at, A.[account_id], B.username "
                    + " FROM Rating A left outer join "
                    + "	(SELECT A.id, A.title, A.content, "
                    + "	A.send_at, A.is_spoiler, B.title as 'film_title', C.username "
                    + "	FROM Review A join "
                    + "	(SELECT id as 'film_id', title FROM Film WHERE id = ? ) B on A.film_id = B.film_id "
                    + "	join"
                    + "	(SELECT id as 'account_id', username FROM Account WHERE id = ?) C on A.account_id = C.account_id "
                    + "	WHERE A.account_id = ? AND A.film_id = ?) B on A.review_id = B.id "
                    + " WHERE A.account_id = ? AND A.film_id = ?";
            PreparedStatement stm = con.prepareStatement(sql);

            stm.setInt(1, filmId);
            stm.setInt(2, accountId);
            stm.setInt(3, accountId);
            stm.setInt(4, filmId);
            stm.setInt(5, accountId);
            stm.setInt(6, filmId);

            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                String username = rs.getString("username");
                String filmTitle = rs.getString("film_title");
                int reviewId = rs.getInt("review_id");
                int score = rs.getInt("score");
                Date rateDate = rs.getDate("rated_at");
                Date reviewDate = rs.getDate("send_at");
                String title = rs.getString("title");
                String content = rs.getString("content");
                boolean spoiler = rs.getBoolean("is_spoiler");

                ReviewDTO review = new ReviewDTO(reviewId, title, content, reviewDate, spoiler, filmId, accountId, filmTitle, username);
                rating = new RatingDTO(accountId, filmId, score, rateDate, reviewId, review);
            }
            DBUtils.closeConnection(con);
        } catch (SQLException e) {
            System.out.println("SQL exception: ");
            e.printStackTrace();
        }

        return rating;
    }

    public boolean addRating(RatingDTO rating) {
        Connection con = null;
        PreparedStatement stm = null;
        int rowInserted;
        boolean result = false;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " INSERT INTO Rating (account_id, film_id, score, rated_at) "
                        + " VALUES (?,?,?,?) ";

                stm = con.prepareStatement(sql);

                stm.setInt(1, rating.getAccountId());
                stm.setInt(2, rating.getFilmId());
                stm.setInt(3, rating.getScore());
                stm.setDate(4, rating.getRateDate());

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

    public boolean addReviewToRating(ReviewDTO review) {
        Connection con = null;
        CallableStatement stm = null;
        int rowInserted;
        boolean result = false;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " {CALL pr_addReviewToRating (?,?,?,?,?,?,?)}";

                stm = con.prepareCall(sql);

                stm.setInt(1, review.getAccountId());
                stm.setInt(2, review.getFilmId());
                stm.setString(3, review.getTitle());
                stm.setString(4, review.getContent());
                stm.setBoolean(5, review.isSpoiler());
                stm.setDate(6, Date.valueOf(LocalDate.now()));

                stm.registerOutParameter(7, java.sql.Types.INTEGER);

                stm.executeUpdate();
                rowInserted = stm.getInt(8);

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

    public boolean addRatingWithReview(RatingDTO rating) {
        Connection con = null;
        CallableStatement stm = null;
        int rowInserted;
        boolean result = false;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " {CALL pr_addRatingWithReview(?,?,?,?,?,?,?,?)}  ";

                stm = con.prepareCall(sql);

                stm.setInt(1, rating.getAccountId());
                stm.setInt(2, rating.getFilmId());
                stm.setInt(3, rating.getScore());
                stm.setDate(4, rating.getRateDate());
                stm.setString(5, rating.getReview().getTitle());
                stm.setString(6, rating.getReview().getContent());
                stm.setBoolean(7, rating.getReview().isSpoiler());
                stm.registerOutParameter(8, java.sql.Types.INTEGER);

                stm.executeUpdate();
                rowInserted = stm.getInt(8);

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

    public boolean editRating(RatingDTO rating) {
        Connection con = null;
        PreparedStatement stm = null;
        int rowInserted;
        boolean result = false;

        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " UPDATE Rating "
                        + "	SET score = ?, rated_at = ? "
                        + "	WHERE account_id = ? AND film_id = ? ";

                stm = con.prepareStatement(sql);

                stm.setInt(1, rating.getScore());
                stm.setDate(2, rating.getRateDate());
                stm.setInt(3, rating.getAccountId());
                stm.setInt(4, rating.getFilmId());

                rowInserted = stm.executeUpdate();

                if (rowInserted > 0) {
                    sql = " UPDATE Review  "
                            + "	SET title = ?, content = ?, "
                            + " is_spoiler = ?, send_at = ? "
                            + "	WHERE account_id = ? AND film_id = ? ";
                    stm.close();
                    stm = con.prepareStatement(sql);
                    stm.setString(1, rating.getReview().getTitle());
                    stm.setString(2, rating.getReview().getContent());
                    stm.setBoolean(3, rating.getReview().isSpoiler());
                    stm.setDate(4, rating.getReview().getSendDate());
                    stm.setInt(5, rating.getAccountId());
                    stm.setInt(6, rating.getFilmId());

                    rowInserted = stm.executeUpdate();
                    if (rowInserted > 0) {
                        result = true;
                    }
                }
            }
            DBUtils.closeConnection(con);
        } catch (SQLException e) {
            System.out.println("SQL exception: ");
            e.printStackTrace();
        }

        return result;
    }

    public static void main(String[] args) {
        ReviewDTO review = new ReviewDTO(100, "Testinggg", "this is a testing content", true, Date.valueOf(LocalDate.now()), 8, 8);
        RatingDTO rating = new RatingDTO(8, 8, 7, Date.valueOf(LocalDate.now()), review.getId(), review);
        RatingDAO dao = new RatingDAO();
        boolean result = dao.addRatingWithReview(rating);
        if (result) {
            System.out.println(result);
        }

        RatingDTO getR = null;
        getR = dao.getRating(rating.getAccountId(), rating.getFilmId());
        System.out.println(getR);
    }
}
