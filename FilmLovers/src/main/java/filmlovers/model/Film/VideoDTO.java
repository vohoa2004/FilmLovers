/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.model.Film;

import java.sql.Date;

/**
 *
 * @author vothimaihoa
 */
public class VideoDTO {
    private int id;
    private int film_id;
    private String url;
    private String title;
    private String type;
    private String checkedStatus;
    private Date sendAt;
    private int accountId;

    public VideoDTO() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFilm_id() {
        return film_id;
    }

    public void setFilm_id(int film_id) {
        this.film_id = film_id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCheckedStatus() {
        return checkedStatus;
    }

    public void setCheckedStatus(String checkedStatus) {
        this.checkedStatus = checkedStatus;
    }

    public Date getSendAt() {
        return sendAt;
    }

    public void setSendAt(Date sendAt) {
        this.sendAt = sendAt;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    @Override
    public String toString() {
        return "VideoDTO{" + "id=" + id + ", film_id=" + film_id + ", url=" + url + ", title=" + title + ", type=" + type + ", checkedStatus=" + checkedStatus + ", sendAt=" + sendAt + ", accountId=" + accountId + '}';
    }
    
    
    
}
