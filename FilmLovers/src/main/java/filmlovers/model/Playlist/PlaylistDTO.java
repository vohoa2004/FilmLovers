 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.model.Playlist;

import java.sql.Date;

/**
 *
 * @author vothimaihoa
 */
public class PlaylistDTO {
    private int id;
    private String name;
    private boolean is_public;
    private Date created_at;
    private int account_id;

    public PlaylistDTO() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isIs_public() {
        return is_public;
    }

    public void setIs_public(boolean is_public) {
        this.is_public = is_public;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    @Override
    public String toString() {
        return "PlaylistDTO{" + "id=" + id + ", name=" + name + ", is_public=" + is_public + ", created_at=" + created_at + ", account_id=" + account_id + '}';
    }
    
}
