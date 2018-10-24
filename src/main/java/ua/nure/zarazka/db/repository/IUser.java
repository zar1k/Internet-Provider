package ua.nure.zarazka.db.repository;

import ua.nure.zarazka.db.entity.Tariff;
import ua.nure.zarazka.db.entity.User;

import java.util.List;

/**
 * @author A.Zarazka
 */
public interface IUser extends IEntity<User> {

    User getByLogin(String login);

    List<Tariff> getTariffs(User user);

    void addLinksUsersHasTariffs(User user, String[] tariffsId);

    void deleteLinksUsersHasTariffs(User user);
}
