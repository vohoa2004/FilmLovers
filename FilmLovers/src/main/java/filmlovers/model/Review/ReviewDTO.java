/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.model.Review;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 *
 * @author vothimaihoa
 */
public class ReviewDTO {
    private int id;
    private String title;
    private String content;
    private Date sendDate;
    private boolean spoiler;
    private int filmId;
    private int accountId;
    private String filmTitle;
    private String username;

    public ReviewDTO() {
    }

    public ReviewDTO(int id, String title, String content, boolean spoiler, Date sendDate, int filmId, int accountId) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.sendDate = sendDate;
        this.spoiler = spoiler;
        this.filmId = filmId;
        this.accountId = accountId;
    }

    public ReviewDTO(int id, String title, String content, Date sendDate, boolean spoiler, int filmId, int accountId, String filmTitle, String username) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.sendDate = sendDate;
        this.spoiler = spoiler;
        this.filmId = filmId;
        this.accountId = accountId;
        this.filmTitle = filmTitle;
        this.username = username;
    }

    public ReviewDTO(int id, String title, String content, Date sendDate, boolean spoiler, String filmTitle, String username) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.sendDate = sendDate;
        this.spoiler = spoiler;
        this.filmTitle = filmTitle;
        this.username = username;
    }

    public String getFilmTitle() {
        return filmTitle;
    }

    public void setFilmTitle(String filmTitle) {
        this.filmTitle = filmTitle;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getSendDate() {
        return sendDate;
    }

    public void setSendDate(Date sendDate) {
        this.sendDate = sendDate;
    }


    public boolean isSpoiler() {
        return spoiler;
    }

    public void setSpoiler(boolean spoiler) {
        this.spoiler = spoiler;
    }

    public int getFilmId() {
        return filmId;
    }

    public void setFilmId(int filmId) {
        this.filmId = filmId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    @Override
    public String toString() {
        return "ReviewDTO{" + "id=" + id + ", title=" + title + ", content=" + content +  ", spoiler=" + spoiler + ", filmId=" + filmId + ", accountId=" + accountId + '}';
    }
    
    
}
