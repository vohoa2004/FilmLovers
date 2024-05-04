/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filmlovers.model.Person;

import filmlovers.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author vothimaihoa
 */
public class PersonDAO {
    
    public List<PersonDTO> list () {
        List<PersonDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT id, firstname, lastname, image_link FROM Person ";
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PersonDTO p = new PersonDTO();
                p.setId(rs.getInt("id"));
                p.setFirstName(rs.getString("firstname"));
                p.setLastName(rs.getString("lastname"));
                p.setImageLink(rs.getString("image_link"));
                list.add(p);
            }
            DBUtils.closeConnection(con);
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }
    
    public List<PersonDTO> getCastByFilm (int filmId) {
        List<PersonDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = "SELECT id, firstname, lastname, image_link, character "
                    + " FROM Person p JOIN CastPerson cp on p.id = cp.person_id "
                    + " where film_id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, filmId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                PersonDTO p = new PersonDTO();
                p.setId(rs.getInt("id"));
                p.setFirstName(rs.getString("firstname"));
                p.setLastName(rs.getString("lastname"));
                p.setImageLink(rs.getString("image_link"));
                p.setCharacter(rs.getString("character"));
                list.add(p);
            }
            DBUtils.closeConnection(con);
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }
}
