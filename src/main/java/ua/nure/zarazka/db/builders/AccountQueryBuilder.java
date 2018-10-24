package ua.nure.zarazka.db.builders;

import ua.nure.zarazka.db.entity.Account;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author A.Zarazka
 */
public class AccountQueryBuilder extends QueryBuilder<Account> {
    @Override
    public List<Account> getListOfResult(ResultSet rs) throws SQLException {
        List<Account> accounts = new ArrayList<>();
        while (rs.next()) {
            Account account = new Account();
            account.setId(rs.getLong("id"));
            account.setNumber(rs.getInt("number"));
            account.setBalance(rs.getDouble("balance"));
            accounts.add(account);
        }
        return accounts;
    }

    @Override
    public Account getResult(ResultSet rs) throws SQLException {
        Account account = new Account();
        while (rs.next()) {
            account.setId(rs.getLong("id"));
            account.setNumber(rs.getInt("number"));
            account.setBalance(rs.getDouble("balance"));
        }
        return account;
    }
}
