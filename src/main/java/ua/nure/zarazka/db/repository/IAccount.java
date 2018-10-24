package ua.nure.zarazka.db.repository;

import ua.nure.zarazka.db.entity.Account;

/**
 * @author A.Zarazka
 */
public interface IAccount extends IEntity<Account> {
    long newNumberContract();
}
