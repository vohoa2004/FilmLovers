/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.model.Account;

import filmlovers.utils.HashingEncryptor;
import java.sql.Date;

/**
 *
 * @author vothimaihoa
 */
public class AccountDTO {
    private int id;
    private String username;
    private String email;
    private String firstName;
    private String lastName;
    private String address;
    private Date dateOfBirth;
    private boolean active;
    private String imageURL;
    private String role;
    private String password;

    public AccountDTO() {
    }

    public AccountDTO(int id, String username, String email, String password, String firstName, String lastName, 
            String address, Date dateOfBirth, boolean active, String imageURL, String role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.dateOfBirth = dateOfBirth;
        this.active = active;
        this.imageURL = imageURL;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }
    
    

    @Override
    public String toString() {
        return "AccountDTO{" + "id=" + id + ", username=" + username + ", email=" + email + ", firstName=" + firstName + ", lastName=" + lastName + ", address=" + address + ", dateOfBirth=" + dateOfBirth + ", active=" + active + ", imageURL=" + imageURL + ", role=" + role + '}';
    }
    
    
}
