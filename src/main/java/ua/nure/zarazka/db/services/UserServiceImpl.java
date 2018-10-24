package ua.nure.zarazka.db.services;

import ua.nure.zarazka.db.entity.Tariff;
import ua.nure.zarazka.db.repository.IUser;
import ua.nure.zarazka.db.repository.UserImpl;
import ua.nure.zarazka.db.entity.User;

import java.util.List;

/**
 * @author A.Zarazka
 */
public class UserServiceImpl implements IUserService {
    private final IUser repo = new UserImpl();

    @Override
    public List<User> findAll() {
        return this.repo.getAll();
    }

    @Override
    public User find(long id) {
        return this.repo.getById(id);
    }

    @Override
    public void save(User user) {
        this.repo.create(user);
    }

    @Override
    public void update(User user) {
        this.repo.update(user);
    }

    @Override
    public void remove(int id) {
        this.repo.delete(id);
    }

    @Override
    public User findByLogin(String login) {
        return this.repo.getByLogin(login);
    }

    @Override
    public List<Tariff> findUserTariffs(User user) {
        return this.repo.getTariffs(user);
    }

    @Override
    public void saveLinksUsersHasTariffs(User user, String[] tariffsId) {
        this.repo.addLinksUsersHasTariffs(user, tariffsId);
    }

    @Override
    public void removeLinksUsersHasTariffs(User user) {
        this.repo.deleteLinksUsersHasTariffs(user);
    }
}
