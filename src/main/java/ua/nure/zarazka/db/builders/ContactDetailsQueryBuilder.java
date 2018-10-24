package ua.nure.zarazka.db.builders;

import ua.nure.zarazka.db.entity.ContactDetails;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author A.Zarazka
 */
public class ContactDetailsQueryBuilder extends QueryBuilder<ContactDetails> {
    @Override
    public List<ContactDetails> getListOfResult(ResultSet rs) throws SQLException {
        List<ContactDetails> details1 = new ArrayList<>();
        while (rs.next()) {
            ContactDetails details = new ContactDetails();
            details.setId(rs.getLong("id"));
            details.setCity(rs.getString("city"));
            details.setStreet(rs.getString("street"));
            details.setHome(rs.getString("home"));
            details.setApartment(rs.getString("apartment"));
            details.setEmail(rs.getString("email"));
            details.setPhone(rs.getString("phone"));
            details1.add(details);
        }
        return details1;
    }

    @Override
    public ContactDetails getResult(ResultSet rs) throws SQLException {
        ContactDetails detail = new ContactDetails();
        while (rs.next()) {
            detail.setId(rs.getLong("id"));
            detail.setCity(rs.getString("city"));
            detail.setStreet(rs.getString("street"));
            detail.setHome(rs.getString("home"));
            detail.setApartment(rs.getString("apartment"));
            detail.setEmail(rs.getString("email"));
            detail.setPhone(rs.getString("phone"));
        }
        return detail;
    }
}
