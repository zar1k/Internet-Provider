package ua.nure.zarazka.db.services;

import ua.nure.zarazka.db.entity.Account;
import ua.nure.zarazka.db.repository.AccountImpl;
import ua.nure.zarazka.db.repository.IAccount;

import java.util.List;

/**
 * @author A.Zarazka
 */
public class AccountServiceImpl implements IAccountService {
    private final IAccount repo = new AccountImpl();

    @Override
    public List<Account> findAll() {
        return this.repo.getAll();
    }

    @Override
    public Account find(long id) {
        return this.repo.getById(id);
    }

    @Override
    public void save(Account account) {
        this.repo.create(account);
    }

    @Override
    public void update(Account account) {
        this.repo.update(account);
    }

    @Override
    public void remove(long id) {
        this.repo.delete(id);
    }

    @Override
    public long getNumberContract() {
        return repo.newNumberContract();
    }
}
