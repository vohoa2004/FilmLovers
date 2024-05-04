/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.model.Rating;

import filmlovers.model.Film.FilmDTO;
import filmlovers.model.Review.ReviewDTO;
import java.sql.Date;

/**
 *
 * @author vothimaihoa
 */
public class RatingDTO {
    private int accountId;
    private int filmId;
    private int score;
    private Date rateDate;
    private ReviewDTO review;
    private FilmDTO film;

    public RatingDTO() {
    }

    public RatingDTO(int accountId, int filmId, int score, Date rateDate, int reviewId, ReviewDTO review) {
        this.accountId = accountId;
        this.filmId = filmId;
        this.score = score;
        this.rateDate = rateDate;
        this.review = review;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getFilmId() {
        return filmId;
    }

    public void setFilmId(int filmId) {
        this.filmId = filmId;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Date getRateDate() {
        return rateDate;
    }

    public void setRateDate(Date rateDate) {
        this.rateDate = rateDate;
    }

    public ReviewDTO getReview() {
        return review;
    }

    public void setReview(ReviewDTO review) {
        this.review = review;
    }

    public FilmDTO getFilm() {
        return film;
    }

    public void setFilm(FilmDTO film) {
        this.film = film;
    }
    
    

    @Override
    public String toString() {
        return "RatingDTO{" + "accountId=" + accountId + ", filmId=" + filmId + ", score=" + score + ", rateDate=" + rateDate + ", review=" + review + '}';
    }


    
    
}
