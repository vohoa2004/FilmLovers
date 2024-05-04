/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.model.Playlist;

import filmlovers.model.Film.FilmDAO;
import filmlovers.model.Film.FilmDTO;
import filmlovers.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author vothimaihoa
 */
public class PlaylistDAO {

    public List<PlaylistDTO> getAllPlaylistsByUserID(int accountID) {
        List<PlaylistDTO> list = null;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT * "
                    + "FROM PlayList "
                    + " WHERE account_id = ? ";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, accountID);
            ResultSet rs = stmt.executeQuery();
            if(rs != null){
                list = new ArrayList<>();
                while(rs.next()){
                    PlaylistDTO playlist = new PlaylistDTO();
                    playlist.setId(rs.getInt("id"));
                    playlist.setName(rs.getString("name"));
                    playlist.setIs_public(rs.getBoolean("is_public"));
                    playlist.setAccount_id(accountID);
                    list.add(playlist);
                }
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(PlaylistDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public boolean insertToFauvoriteFilmList(Integer filmID, Integer playlistID) {
        boolean status = false;
        boolean isDuplicate = checkDuplicateFilmInPlaylist(filmID, playlistID);
        if(!isDuplicate){
            try {
                Connection con = DBUtils.getConnection();
                String sql = "INSERT INTO FavouriteFilm (film_id, playlist_id) VALUES (?, ?) ";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setInt(1, filmID);
                stmt.setInt(2, playlistID);
                status = stmt.executeUpdate() > 0 ? true : false;
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(PlaylistDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else status = true; //pair (playlistID - filmID) already exists in Favourite Film Table
        return status;
    }
    
    private boolean checkDuplicateFilmInPlaylist(Integer filmID, Integer playlistID) {
        boolean isDuplicate = false;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT * FROM FavouriteFilm "
                    + "WHERE film_id = ? AND playlist_id = ? ";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, filmID);
            stmt.setInt(2, playlistID);
            ResultSet rs = stmt.executeQuery();
            if(rs != null){
                isDuplicate = rs.next();
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(PlaylistDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isDuplicate;
    }

    public List<FilmDTO> getAllMoviesFromPlaylist(Integer playlistID) {
        List<FilmDTO> listMovies = new ArrayList<>();
        //get all movie IDs for a particular playlistID
        List<Integer> listMovieIDs = getAllMovieIDs(playlistID); 
        FilmDAO filmDAO = new FilmDAO();
        for (Integer movieID : listMovieIDs) {
            FilmDTO film = filmDAO.getFilmDetailsById(movieID);
            listMovies.add(film);
        }
        return listMovies;
    }

    public List<Integer> getAllMovieIDs(Integer playlistID) {
        List<Integer> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT film_id FROM FavouriteFilm WHERE playlist_id = ? ";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, playlistID);
            ResultSet rs = stmt.executeQuery();
            if(rs != null){
                while(rs.next()){
                    Integer movieID = rs.getInt("film_id");
                    list.add(movieID);
                }
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(PlaylistDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    

    public Integer insertNewPlaylist(String playlistName, int accountID) {
        Integer newPlaylistID = null;
        boolean status = false;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "INSERT INTO PlayList (name, is_public, created_at, account_id) "
                    + "VALUES (?, NULL, NULL, ? )";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, playlistName);
            stmt.setInt(2, accountID);
            status = stmt.executeUpdate() > 0 ? true : false;
            if(status){
                newPlaylistID = getMaxPlaylistID();
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(PlaylistDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return newPlaylistID;
    }
    
    public Integer getMaxPlaylistID(){
        Integer maxID = null;
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT TOP 1 id "
                       + "FROM PlayList "
                       + "ORDER BY id DESC";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            if(rs != null){
                if(rs.next())
                    maxID = rs.getInt("id");
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(PlaylistDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return maxID;
    }

}


