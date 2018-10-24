package ua.nure.zarazka.db.builders;

import ua.nure.zarazka.db.entity.Account;
import ua.nure.zarazka.db.entity.ContactDetails;
import ua.nure.zarazka.db.entity.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author A.Zarazka
 */
public class UserQueryBuilder extends QueryBuilder<User> {
    @Override
    public List<User> getListOfResult(ResultSet rs) throws SQLException {
        List<User> users = new ArrayList<>();
        while (rs.next()) {
            User user = new User();
            user.setId(rs.getLong("id"));
            user.setLogin(rs.getString("login"));
            user.setPassword(rs.getString("password"));
            user.setFirstName(rs.getString("first_name"));
            user.setLastName(rs.getString("last_name"));
            user.setSurname(rs.getString("surname"));
            user.setBlocked(rs.getBoolean("blocked"));
            user.setRoleId(rs.getInt("roles_id"));
            user.setDetails(new ContactDetails(rs.getLong("contact_details_id")));
            user.setAccount(new Account(rs.getLong("accounts_id")));
            users.add(user);
        }
        return users;
    }

    @Override
    public User getResult(ResultSet rs) throws SQLException {
        User user = new User();
        while (rs.next()) {
            user.setId(rs.getLong("id"));
            user.setLogin(rs.getString("login"));
            user.setPassword(rs.getString("password"));
            user.setFirstName(rs.getString("first_name"));
            user.setLastName(rs.getString("last_name"));
            user.setSurname(rs.getString("surname"));
            user.setBlocked(rs.getBoolean("blocked"));
            user.setRoleId(rs.getInt("roles_id"));
            user.setDetails(new ContactDetails(rs.getLong("contact_details_id")));
            user.setAccount(new Account(rs.getLong("accounts_id")));
        }
        return user;
    }
}