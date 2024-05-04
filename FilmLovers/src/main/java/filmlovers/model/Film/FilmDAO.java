/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.model.Film;

import filmlovers.utils.DBUtils;
import filmlovers.utils.URLValidation;
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
public class FilmDAO {

    // list all only takes the bare-minimum info to display (id, title, type, releaseYear
    // all the information must be query only in the detail page
    public List<FilmDTO> list(String status, int numberPage, int pageSize) {
        List<FilmDTO> result = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            StringBuilder sql = new StringBuilder();
            if (status.equals("processing")) {
                sql.append(" SELECT id, title, add_date, account_id "
                        + " from Film WHERE checked_status = ? "
                        + " ORDER BY add_date ");

            } else {
                sql.append(" SELECT A.id, A.title, A.type, A.release_year, A.photo, A.add_date, A.account_id, B.avg_rating "
                        + " FROM Film A left outer join  "
                        + "	(SELECT film_id, ROUND(AVG(Cast(score as Float)),1) as 'avg_rating' "
                        + "	FROM Rating "
                        + "	GROUP BY film_id) B on A.id = B.film_id WHERE A.checked_status = ? "
                        + "     ORDER BY A.id ");
            }

            sql.append("\nOFFSET ? ROWS"
                    + "\nFETCH NEXT ")
                    .append(pageSize)
                    .append(" ROWS ONLY;");

            PreparedStatement stmt = con.prepareStatement(sql.toString());
            
            stmt.setString(1, status);
            stmt.setInt(2, ((numberPage - 1) * pageSize));
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                FilmDTO film = new FilmDTO();
                film.setId(rs.getInt("id")); // dung setter tung thang ntn hay hon dung constructor vi constructor mat cong ngoi nghi can bao nhieu field!!
                film.setTitle(rs.getNString("title"));
                if (status.equals("processing")) {
                    film.setAccountId(rs.getInt("account_id"));
                    film.setAddDate(rs.getDate("add_date"));
                } else {
                    film.setType(rs.getString("type"));
                    film.setReleaseYear(rs.getInt("release_year"));
                    film.setPhoto(rs.getString("photo"));
                    film.setAddDate(rs.getDate("add_date"));
                    film.setAvgRating(rs.getFloat("avg_rating"));
                }
                result.add(film);
            }
            DBUtils.closeConnection(con);
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }
//**********************************************************************************************************************

    public int countFilm(String status) {
        String sql = "select count(id) as count from film";

        int result = 0;
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            if (status != null && !status.equals("")) {
                sql += " where checked_status = ?";
                ps.setString(1, status);
            }
            ResultSet rs = ps.executeQuery();
            if (rs != null) {
                if (rs.next()) {
                    result = rs.getInt("count");
                }
            }
            DBUtils.closeConnection(con);
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }

//**********************************************************************************************************************    
    public List<FilmDTO> getRandomList(int n, String type) {
        List<FilmDTO> result = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " SELECT TOP " + n + " id, title, type, release_year, photo\n"
                    + " FROM Film\n"
                    + " WHERE [type] = ?\n AND checked_status = 'approved' "
                    + " ORDER BY NEWID(); ";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, type);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                FilmDTO film = new FilmDTO();
                film.setPhoto(rs.getString("photo"));
                film.setId(rs.getInt("id")); // dung setter tung thang ntn hay hon dung constructor vi constructor mat cong ngoi nghi can bao nhieu field!!
                film.setTitle(rs.getNString("title"));
                film.setType(rs.getString("type"));
                film.setReleaseYear(rs.getInt("release_year"));
                result.add(film);
            }
            DBUtils.closeConnection(con);
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }

//**********************************************************************************************************************
    public List<FilmDTO> getTodayList(int numberOfFilm) {
        List<FilmDTO> result = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT TOP " + numberOfFilm + " A.id, A.title, A.type, A.release_year, "
                    + " A.photo, A.add_date, A.account_id, B.avg_rating "
                    + " FROM Film A LEFT OUTER JOIN "
                    + " (SELECT film_id, rated_at, ROUND(AVG(CAST(score AS FLOAT)), 1) AS 'avg_rating' "
                    + "  FROM Rating "
                    + "  GROUP BY film_id, rated_at) B "
                    + " ON A.id = B.film_id "
                    + " WHERE A.checked_status = 'approved' "
                    + " ORDER BY rated_at DESC ";

            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                FilmDTO film = new FilmDTO();
                film.setPhoto(rs.getString("photo"));
                film.setId(rs.getInt("id")); // dung setter tung thang ntn hay hon dung constructor vi constructor mat cong ngoi nghi can bao nhieu field!!
                film.setTitle(rs.getNString("title"));
                film.setType(rs.getString("type"));
                film.setReleaseYear(rs.getInt("release_year"));
                film.setAvgRating(rs.getFloat("avg_rating"));
                result.add(film);
            }
            DBUtils.closeConnection(con);
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }

//**********************************************************************************************************************
    public FilmDTO getFilmDetailsById(int id) {
        FilmDTO result = new FilmDTO();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " SELECT A.id, A.title, A.type, A.language, "
                    + " A.country, A.release_year, A.release_month, "
                    + " A.release_status, A.description, A.story_line, "
                    + " A.runtime, A.visible_status, A.add_date, A.photo, B.avg_rating "
                    + " from Film A left outer join  "
                    + "	(SELECT film_id, ROUND(AVG(Cast(score as Float)),1) as 'avg_rating' "
                    + "	FROM Rating GROUP BY film_id) B on A.id = B.film_id "
                    + " WHERE A.id = ? ";

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                FilmDTO film = new FilmDTO();
                film.setId(rs.getInt("id"));
                film.setTitle(rs.getNString("title"));
                film.setType(rs.getString("type"));
                film.setLanguage(rs.getString("language"));
                film.setCountry(rs.getString("country"));
                film.setReleaseYear(rs.getInt("release_year"));
                film.setReleaseMonth(rs.getInt("release_month"));
                film.setReleaseStatus(rs.getString("release_status"));
                film.setDescription(rs.getNString("description"));
                film.setStoryLine(rs.getNString("story_line"));
                film.setRuntime(rs.getInt("runtime"));
                film.setVisibleStatus(rs.getString("visible_status"));
                film.setAddDate(rs.getDate("add_date"));
                film.setPhoto(rs.getString("photo"));
                film.setAvgRating(rs.getFloat("avg_rating"));
                result = film;
            }
            DBUtils.closeConnection(con);
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return result;
    }

//**********************************************************************************************************************
    public boolean insertFilm(FilmDTO film) {
        boolean success = false;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "INSERT INTO Film (title, type, language, country, release_year, "
                    + " release_month, release_status, description, story_line, "
                    + " runtime, visible_status, add_date, photo, checked_status, account_id) "
                    + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, film.getTitle());
            stmt.setString(2, film.getType());
            stmt.setString(3, film.getLanguage());
            stmt.setString(4, film.getCountry());
            stmt.setInt(5, film.getReleaseYear());
            stmt.setInt(6, film.getReleaseMonth());
            stmt.setString(7, film.getReleaseStatus());
            stmt.setString(8, film.getDescription());
            stmt.setString(9, film.getStoryLine());
            stmt.setInt(10, film.getRuntime());
            stmt.setString(11, film.getVisibleStatus());
            stmt.setDate(12, film.getAddDate());
            stmt.setString(13, film.getPhoto());
            stmt.setString(14, film.getCheckedStatus());
            stmt.setInt(15, film.getAccountId());

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                success = true;
            }
            DBUtils.closeConnection(con);
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }

        return success;
    }

//**********************************************************************************************************************
    public List<FilmDTO> searchByFilter(String title, int lastFilmID, int releaseYearFrom, int releaseYearTo, String country,
            String language, String type, List<String> genres, int runtimeFrom,
            int runtimeTo, List<String> keywords, int numberOfFilmPerPage) {

        List<FilmDTO> films = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            StringBuilder query;
            query = constructFilterQuery(title, releaseYearFrom,
                    releaseYearTo, country, language, type, genres,
                    runtimeFrom, runtimeTo, keywords, numberOfFilmPerPage);

            String sql = query.toString();

            PreparedStatement stmt = con.prepareStatement(sql);

            int paramIndex = 1;

            stmt.setInt(paramIndex++, lastFilmID);

            if (title != null && !title.isEmpty()) {
                stmt.setString(paramIndex++, "%" + title + "%");
            }

            if (releaseYearFrom != -1) { // default = -1 if not provide
                stmt.setInt(paramIndex++, releaseYearFrom);
            }
            if (releaseYearTo != -1) {
                stmt.setInt(paramIndex++, releaseYearTo);
            }
            if (country != null && !country.isEmpty()) {
                stmt.setString(paramIndex++, country);
            }
            if (language != null && !language.isEmpty()) {
                stmt.setString(paramIndex++, language);
            }
            if (runtimeFrom != -1) {
                stmt.setInt(paramIndex++, runtimeFrom);
            }
            if (runtimeTo != -1) {
                stmt.setInt(paramIndex++, runtimeTo);
            }

            if (type != null && !type.isEmpty()) {
                stmt.setString(paramIndex++, type);
            }

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                FilmDTO film = new FilmDTO();
                film.setPhoto(rs.getString("photo"));
                film.setId(rs.getInt("id"));
                film.setTitle(rs.getNString("title"));
                film.setType(rs.getString("type"));
                film.setReleaseYear(rs.getInt("release_year"));
                film.setAvgRating(rs.getFloat("avg_rating"));
                films.add(film);
            }
            DBUtils.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return films;
    }

//**********************************************************************************************************************
    private StringBuilder constructFilterQuery(String title, int releaseYearFrom, int releaseYearTo, String country,
            String language, String type, List<String> genres, int runtimeFrom,
            int runtimeTo, List<String> keywords, int numberOfFilmPerPage) {
        StringBuilder sql = new StringBuilder("SELECT DISTINCT id, title, type, release_year, photo, avg_rating "
                + " FROM Film f left outer join  "
                + "	(SELECT film_id, ROUND(AVG(Cast(score as Float)),1) as 'avg_rating' "
                + "	FROM Rating "
                + "	GROUP BY film_id) B on f.id = B.film_id "
                + " LEFT JOIN Film_Genre fg on f.id = fg.film_id "
                + " LEFT JOIN Film_Keyword fk on f.id = fk.film_id"
                + " WHERE f.id > ?");

        if (title != null && !title.isEmpty()) {
            sql.append(" AND title LIKE ? ");
        }
        if (releaseYearFrom != -1) {
            sql.append(" AND release_year >= ?");
        }
        if (releaseYearTo != -1) {
            sql.append(" AND release_year <= ?");
        }
        if (country != null && !country.isEmpty()) {
            sql.append(" AND country = ?");
        }
        if (language != null && !language.isEmpty()) {
            sql.append(" AND language = ?");
        }
        if (runtimeFrom != -1) {
            sql.append(" AND runtime >= ?");
        }
        if (runtimeTo != -1) {
            sql.append(" AND runtime <= ?");
        }
        if (type != null && !type.isEmpty()) {
            sql.append(" AND type = ?");
        }
        if (genres != null && !genres.isEmpty()) {
            sql.append(" AND fg.genre_name IN (");
            for (int i = 0; i < genres.size(); i++) {
                if (i == genres.size() - 1) {
                    sql.append("'").append(genres.get(i)).append("')");
                } else {
                    sql.append("'").append(genres.get(i)).append("',");
                }
            }
        }
        if (keywords != null && !keywords.isEmpty()) {
            sql.append(" AND fk.keyword IN (");
            for (int i = 0; i < keywords.size(); i++) {
                if (i == keywords.size() - 1) {
                    sql.append("'").append(keywords.get(i)).append("')");
                } else {
                    sql.append("'").append(keywords.get(i)).append("',");
                }
            }
        }
        sql.append("\nORDER BY f.id"
                + "\nOFFSET 0 ROWS"
                + "\nFETCH NEXT ")
                .append(numberOfFilmPerPage)
                .append(" ROWS ONLY;");
        return sql;
    }
//**********************************************************************************************************************

    public boolean updateCheckedStatus(String table, String status, int filmId) {
        boolean updateStatus = false;
        String sql = "UPDATE " + table + " SET checked_status = ? WHERE id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, filmId);
            int rows = ps.executeUpdate();
            if (rows > 0) {
                updateStatus = true;
            }
            DBUtils.closeConnection(conn);
        } catch (SQLException e) {
            System.out.println("SQL Error. Details: ");
            e.printStackTrace();
        }
        return updateStatus;
    }

//**********************************************************************************************************************
    public List<String> getGenres() {
        List<String> genres = new ArrayList<>();
        String sql = "SELECT * FROM Genre";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                genres.add(rs.getString("name"));
            }
            DBUtils.closeConnection(con);
        } catch (SQLException e) {
            System.out.println("SQL Error. Details: ");
            e.printStackTrace();
        }
        return genres;
    }

    public List<String> getGenres(int filmId) {
        List<String> genres = new ArrayList<>();
        String sql = "SELECT * FROM Film_Genre WHERE film_id = ? AND checked_status = 'approved'";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, filmId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                genres.add(rs.getString("genre_name"));
            }
            DBUtils.closeConnection(con);
        } catch (SQLException e) {
            System.out.println("SQL Error. Details: ");
            e.printStackTrace();
        }
        return genres;
    }

//**********************************************************************************************************************
    public List<PhotoDTO> getNPhotosByFilmId(int n, int filmId) {
        List<PhotoDTO> list = new ArrayList<>();
        String sql;
        if (n == -1) {
            sql = " SELECT id, image_link "
                + " from Photo where film_id = ? AND checked_status = ?";
        } else {
            sql = " SELECT TOP " + n + " id, image_link "
                + " from Photo where film_id = ? AND checked_status = ?";
        }

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, filmId);
            stmt.setString(2, "approved");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                PhotoDTO p = new PhotoDTO();
                p.setId(rs.getInt("id"));
                p.setFilmId(filmId);
                p.setImageLink(rs.getString("image_link"));
                p.setCheckedStatus("approved");
                list.add(p);
            }
            DBUtils.closeConnection(con);
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

//**********************************************************************************************************************
    public List<VideoDTO> getTopNVideosByFilm(int n, int filmId) {
        List<VideoDTO> list = new ArrayList<>();
        String sql = " SELECT TOP "+ n +" id, url "
                + " from Video where film_id = ? AND checked_status = ?";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, filmId);
            stmt.setString(2, "approved");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                VideoDTO v = new VideoDTO();
                v.setId(rs.getInt("id"));
                v.setFilm_id(filmId);
                v.setUrl(rs.getString("url"));
                v.setCheckedStatus("approved");
                list.add(v);
            }
            DBUtils.closeConnection(con);
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

//***********************************************************************************************************************    
    public PhotoDTO getPhotoById(int id) {
        String sql = " SELECT film_id, image_link, title "
                + " from Photo where film_id = ? AND checked_status = ?";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.setString(2, "approved");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                PhotoDTO p = new PhotoDTO();
                p.setId(id);
                p.setFilmId(rs.getInt("film_id"));
                p.setImageLink(rs.getString("image_link"));
                p.setTitle(rs.getString("title"));
                p.setCheckedStatus("approved");
            }
            DBUtils.closeConnection(con);
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }
//***********************************************************************************************************************

    public List<VideoDTO> getAllVideosByFilm(int filmId) {
        List<VideoDTO> list = new ArrayList<>();
        String sql = " SELECT id, url "
                + " from Video where film_id = ? AND checked_status = ?";

        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, filmId);
            stmt.setString(2, "approved");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                VideoDTO v = new VideoDTO();
                v.setId(rs.getInt("id"));
                v.setFilm_id(filmId);
                v.setUrl(rs.getString("url"));
                v.setCheckedStatus("approved");
                list.add(v);
            }
            DBUtils.closeConnection(con);
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }
//***********************************************************************************************************************

    public boolean insertGenre(int filmId, String genre, String checkedStatus, Date sendAt, int accountId) {
        boolean status = false;
        String sql = "INSERT INTO Film_Genre(genre_name, film_id, checked_status, send_at, account_id) VALUES(?,?,?,?,?)";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, genre);
            stmt.setInt(2, filmId);
            stmt.setString(3, checkedStatus);
            stmt.setDate(4, sendAt);
            stmt.setInt(5, accountId);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                status = true;
            }
            DBUtils.closeConnection(con);
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return status;
    }
//***********************************************************************************************************************

    public boolean insertVideo(int filmId, String title, String url, String type, String checkedStatus, int accountId, Date sendAt) {
        boolean status = false;
        String sql = "  INSERT INTO Video(film_id, title, [url], [type], checked_status, account_id, send_at) VALUES(?,?,?,?,?,?,?)";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, filmId);
            stmt.setString(2, title);
            stmt.setString(3, url);
            stmt.setString(4, type);
            stmt.setString(5, checkedStatus);
            stmt.setInt(6, accountId);
            stmt.setDate(7, sendAt);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                status = true;
            }
            DBUtils.closeConnection(con);
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return status;
    }
//***********************************************************************************************************************
    
    public boolean insertPhoto(int filmId, String title, String url, String checkedStatus, int accountId, Date sendAt ) {
        boolean status = false;
        String sql = "  INSERT INTO Photo(film_id, title, [image_link], [type], checked_status, account_id, send_at) "
                    + " VALUES(?,?,?,?,?,?)";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, filmId);
            stmt.setString(2, title);
            stmt.setString(3, url);
            stmt.setString(4, checkedStatus);
            stmt.setInt(5, accountId);
            stmt.setDate(6, sendAt);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                status = true;
            }
            DBUtils.closeConnection(con);
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return status;
    }
    
//***********************************************************************************************************************

    public List<VideoDTO> listVideo(String checkedStatus) {
        List<VideoDTO> list = null;
        String sql = "SELECT id, film_id, url, title, type, checked_status, "
                + " send_at, account_id FROM Video where checked_status = ?";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, checkedStatus);
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                list = new ArrayList<>();
                while (rs.next()) {
                    VideoDTO v = new VideoDTO();
                    v.setId(rs.getInt("id"));
                    v.setFilm_id(rs.getInt("film_id"));
                    v.setUrl(rs.getString("url"));
                    v.setTitle(rs.getString("title"));
                    v.setType(rs.getString("type"));
                    v.setCheckedStatus(checkedStatus);
                    v.setAccountId(rs.getInt("account_id"));
                    v.setSendAt(rs.getDate("send_at"));
                    list.add(v);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error in servlet. Details:" + e.getMessage());
            e.printStackTrace();
        }

        return list;
    }
//***********************************************************************************************************************   
        public List<VideoDTO> listVideo(String checkedStatus, String sortCol) {
        List<VideoDTO> list = null;
        String sql = "SELECT id, film_id, url, title, type, checked_status, "
                + " send_at, account_id FROM Video where checked_status = ?"
                + " order by " + sortCol + " DESC ";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, checkedStatus);
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                list = new ArrayList<>();
                while (rs.next()) {
                    VideoDTO v = new VideoDTO();
                    v.setId(rs.getInt("id"));
                    v.setFilm_id(rs.getInt("film_id"));
                    v.setUrl(URLValidation.convertToEmbedLink(rs.getString("url")));
                    v.setTitle(rs.getString("title"));
                    v.setType(rs.getString("type"));
                    v.setCheckedStatus(checkedStatus);
                    v.setAccountId(rs.getInt("account_id"));
                    v.setSendAt(rs.getDate("send_at"));
                    list.add(v);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error in servlet. Details:" + e.getMessage());
            e.printStackTrace();
        }

        return list;
    }

    
//***********************************************************************************************************************   
    public VideoDTO getVideoById(int id) {
        VideoDTO video = null;
        String sql = "SELECT id, film_id, url, title, type, checked_status, "
                + " send_at, account_id FROM Video where id = ?";
        try {
            Connection con = DBUtils.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {

                if (rs.next()) {
                    VideoDTO v = new VideoDTO();
                    v.setId(rs.getInt("id"));
                    v.setFilm_id(rs.getInt("film_id"));
                    v.setUrl(rs.getString("url"));
                    v.setTitle(rs.getString("title"));
                    v.setType(rs.getString("type"));
                    v.setCheckedStatus(rs.getString("checked_status"));
                    v.setAccountId(rs.getInt("account_id"));
                    v.setSendAt(rs.getDate("send_at"));
                    video = v;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error in servlet. Details:" + e.getMessage());
            e.printStackTrace();
        }

        return video;
    }

//***********************************************************************************************************************   
    //test
    public static void main(String[] args) {
        FilmDAO fd = new FilmDAO();
//        List<FilmDTO> list = fd.list("processing");

        // print all
//        for (FilmDTO f : list) {
//            System.out.println(f.toString());
//        }
//        List<VideoDTO> videos = fd.listVideo("processing");
//        for (VideoDTO f : videos) {
//            System.out.println(f.toString());
//        }
    }

//***********************************************************************************************************************
}
