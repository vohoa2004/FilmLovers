/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.model.Playlist;

/**
 *
 * @author vothimaihoa
 */
public class FavouriteFilmDTO {
    private int playlist_id;
    private int film_id;

    public FavouriteFilmDTO() {
    }

    public FavouriteFilmDTO(int playlist_id, int film_id) {
        this.playlist_id = playlist_id;
        this.film_id = film_id;
    }

    public int getPlaylist_id() {
        return playlist_id;
    }

    public void setPlaylist_id(int playlist_id) {
        this.playlist_id = playlist_id;
    }

    public int getFilm_id() {
        return film_id;
    }

    public void setFilm_id(int film_id) {
        this.film_id = film_id;
    }

    @Override
    public String toString() {
        return "FavouriteFilmDTO{" + "playlist_id=" + playlist_id + ", film_id=" + film_id + '}';
    }
    
}
