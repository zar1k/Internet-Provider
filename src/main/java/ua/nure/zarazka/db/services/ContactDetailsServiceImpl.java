package ua.nure.zarazka.db.services;

import ua.nure.zarazka.db.entity.ContactDetails;
import ua.nure.zarazka.db.repository.ContactDetailsImpl;
import ua.nure.zarazka.db.repository.IContactDetails;

import java.util.List;

/**
 * @author A.Zarazka
 */
public class ContactDetailsServiceImpl implements IContactDetailsService {
    private final IContactDetails repo = new ContactDetailsImpl();

    @Override
    public List<ContactDetails> findAll() {
        return this.repo.getAll();
    }

    @Override
    public ContactDetails find(long id) {
        return this.repo.getById(id);
    }

    @Override
    public void save(ContactDetails account) {
        this.repo.create(account);
    }

    @Override
    public void update(ContactDetails account) {
        this.repo.update(account);
    }

    @Override
    public void remove(int id) {
        this.repo.delete(id);
    }
}
