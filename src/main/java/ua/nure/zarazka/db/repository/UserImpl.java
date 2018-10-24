package ua.nure.zarazka.db.repository;

import ua.nure.zarazka.db.entity.Tariff;
import ua.nure.zarazka.db.entity.User;
import ua.nure.zarazka.db.builders.TariffQueryBuilder;
import ua.nure.zarazka.db.builders.QueryBuilder;
import ua.nure.zarazka.db.builders.UserQueryBuilder;

import java.util.List;

/**
 * @author A.Zarazka
 */
public class UserImpl implements IUser {
    private static final String GET_ALL = "SELECT * FROM provider.users";
    private static final String GET_BY_ID = "SELECT id, login, password, first_name, last_name, surname, blocked, roles_id, contact_details_id, accounts_id FROM provider.users WHERE id = ?";
    private static final String GET_BY_LOGIN = "SELECT id, login, password, first_name, last_name, surname, blocked, roles_id, contact_details_id, accounts_id FROM provider.users WHERE login = ?";
    private static final String CREATE = "INSERT INTO provider.users (login, password, first_name, last_name, surname, blocked, roles_id, contact_details_id, accounts_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE = "UPDATE provider.users SET login = ?, password = ?, first_name = ?, last_name = ?, surname = ?, blocked = ?, roles_id = ? WHERE id = ?";
    private static final String DELETE = "DELETE FROM provider.users WHERE id = ?";

    private static final String ADD_LINK_USERS_HAS_TRAFFICS = "INSERT INTO provider.users_has_tariffs (users_id, tariffs_id) VALUES (?, ?)";
    private static final String GET_LINK_USERS_HAS_TRAFFICS = "SELECT t.id, t.name, t.description, t.price, t.services_id FROM tariffs AS t JOIN users_has_tariffs AS uht ON t.id = uht.tariffs_id AND uht.users_id = (SELECT id FROM users WHERE id = ?)";
    private static final String DELETE_LINK_USERS_HAS_TRAFFICS = "DELETE FROM provider.users_has_tariffs WHERE users_id = ?";

    private static final String GET_NEXT_AUTO_INCREMENT = "SELECT `AUTO_INCREMENT` FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'provider' AND TABLE_NAME = 'users'";

    private DBManager instance = DBManager.getInstance();
    private QueryBuilder queryBuilder = new UserQueryBuilder();

    @Override
    public List<User> getAll() {
        return queryBuilder.executeAndReturnList(instance, GET_ALL);
    }

    @Override
    public User getById(long id) {
        return (User) queryBuilder.executeAndReturn(instance, GET_BY_ID, id);
    }

    @Override
    public void create(User user) {
        long id = queryBuilder.getNextAutoIncrement(instance, GET_NEXT_AUTO_INCREMENT);
        queryBuilder.execute(instance, CREATE, user.getLogin(), user.getPassword(), user.getFirstName(), user.getLastName(), user.getSurname(), user.isBlocked(), user.getRoleId(), id, id);
    }

    @Override
    public void update(User user) {
        queryBuilder.execute(instance, UPDATE, user.getLogin(), user.getPassword(), user.getFirstName(), user.getLastName(), user.getSurname(), user.isBlocked(), user.getRoleId(), user.getId());
    }

    @Override
    public void delete(long id) {
        queryBuilder.execute(instance, DELETE, id);
    }

    @Override
    public User getByLogin(String login) {
        return (User) queryBuilder.executeAndReturn(instance, GET_BY_LOGIN, login);
    }

    @Override
    public List<Tariff> getTariffs(User user) {
        QueryBuilder queryBuilder = new TariffQueryBuilder();
        return queryBuilder.executeAndReturnList(instance, GET_LINK_USERS_HAS_TRAFFICS, user.getId());
    }

    @Override
    public void addLinksUsersHasTariffs(User user, String[] tariffsId) {
        User tmp = getByLogin(user.getLogin());
        QueryBuilder queryBuilder = new TariffQueryBuilder();
        for (String id : tariffsId) {
            queryBuilder.execute(instance, ADD_LINK_USERS_HAS_TRAFFICS, tmp.getId(), id);
        }
    }

    @Override
    public void deleteLinksUsersHasTariffs(User user) {
        queryBuilder.execute(instance, DELETE_LINK_USERS_HAS_TRAFFICS, user.getId());
    }
}
