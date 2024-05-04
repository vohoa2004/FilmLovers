/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.model.Film;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author vothimaihoa
 */
public class FilmDTO implements Serializable{
    private String photo;
    private int id;
    private String title;
    private String type;
    private String language;
    private String country;
    private int releaseYear;
    private int releaseMonth;
    private String releaseStatus;
    private String description;
    private String storyLine;
    private int runtime;
    private String visibleStatus;
    private Date addDate;
    private String checkedStatus;
    private int accountId;
    private float avgRating;

    public FilmDTO() {
    }

    public FilmDTO(String photo, String title, String type, String language, 
            String country, int releaseYear, int releaseMonth, String releaseStatus, 
            String description, String storyLine, int runtime, String visibleStatus, 
            Date addDate, String checkedStatus, int accountId) {
        this.photo = photo;
        this.title = title;
        this.type = type;
        this.language = language;
        this.country = country;
        this.releaseYear = releaseYear;
        this.releaseMonth = releaseMonth;
        this.releaseStatus = releaseStatus;
        this.description = description;
        this.storyLine = storyLine;
        this.runtime = runtime;
        this.visibleStatus = visibleStatus;
        this.addDate = addDate;
        this.checkedStatus = checkedStatus;
        this.accountId = accountId;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getReleaseYear() {
        return releaseYear;
    }

    public void setReleaseYear(int releaseYear) {
        this.releaseYear = releaseYear;
    }

    public int getReleaseMonth() {
        return releaseMonth;
    }

    public void setReleaseMonth(int releaseMonth) {
        this.releaseMonth = releaseMonth;
    }

    public String getReleaseStatus() {
        return releaseStatus;
    }

    public void setReleaseStatus(String releaseStatus) {
        this.releaseStatus = releaseStatus;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStoryLine() {
        return storyLine;
    }

    public void setStoryLine(String storyLine) {
        this.storyLine = storyLine;
    }

    public int getRuntime() {
        return runtime;
    }

    public void setRuntime(int runtime) {
        this.runtime = runtime;
    }

    public String getVisibleStatus() {
        return visibleStatus;
    }

    public void setVisibleStatus(String visibleStatus) {
        this.visibleStatus = visibleStatus;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }  

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getCheckedStatus() {
        return checkedStatus;
    }

    public void setCheckedStatus(String checkedStatus) {
        this.checkedStatus = checkedStatus;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }
    
    public float getAvgRating() {
        return avgRating;
    }

    public void setAvgRating(float avgRating) {
        this.avgRating = avgRating;
    }
    
    @Override
    public String toString() {
        return "FilmDTO{" + "id=" + id + ", title=" + title + ", type=" + type + ", language=" + language + ", country=" + country + ", releaseYear=" + releaseYear + ", releaseMonth=" + releaseMonth + ", releaseStatus=" + releaseStatus + ", description=" + description + ", storyLine=" + storyLine + ", runtime=" + runtime + ", visibleStatus=" + visibleStatus + ", addDate=" + addDate + '}';
    }
    
    public String toString2() {
        return "FilmDTO{" + "id=" + id + ", title=" + title + ", type=" + type + ", releaseYear=" + releaseYear ;
    }
}
