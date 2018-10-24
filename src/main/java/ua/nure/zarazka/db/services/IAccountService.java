package ua.nure.zarazka.db.services;

import ua.nure.zarazka.db.entity.Account;

import java.util.List;

/**
 * @author A.Zarazka
 */
public interface IAccountService {

    List<Account> findAll();

    Account find(long id);

    void save(Account account);

    void update(Account account);

    void remove(long id);

    long getNumberContract();
}
