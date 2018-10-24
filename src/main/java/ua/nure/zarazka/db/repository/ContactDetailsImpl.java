package ua.nure.zarazka.db.repository;

import ua.nure.zarazka.db.entity.ContactDetails;
import ua.nure.zarazka.db.builders.ContactDetailsQueryBuilder;
import ua.nure.zarazka.db.builders.QueryBuilder;

import java.util.List;

/**
 * @author A.Zarazka
 */
public class ContactDetailsImpl implements IContactDetails {
    private static final String CREATE = "INSERT INTO provider.contact_details (id, city, street, home, apartment, email, phone) VALUES (?, ?, ?, ?, ?, ?, ?)";
    private static final String GET_ALL = "SELECT * FROM provider.contact_details";
    private static final String GET_BY_ID = "SELECT id, city, street, home, apartment, email, phone FROM provider.contact_details WHERE id = ?";
    private static final String UPDATE = "UPDATE provider.contact_details SET email = ?, phone = ? WHERE id = ?";
    private static final String DELETE = "DELETE FROM provider.contact_details WHERE id = ?";
    private static final String GET_NEXT_AUTO_INCREMENT = "SELECT `AUTO_INCREMENT` FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'provider' AND TABLE_NAME = 'users'";

    private DBManager instance = DBManager.getInstance();
    private QueryBuilder queryBuilder = new ContactDetailsQueryBuilder();

    @Override
    public List<ContactDetails> getAll() {
        return this.queryBuilder.executeAndReturnList(instance, GET_ALL);
    }

    @Override
    public ContactDetails getById(long id) {
        return (ContactDetails) this.queryBuilder.executeAndReturn(instance, GET_BY_ID, id);
    }

    @Override
    public void create(ContactDetails details) {
        long id = queryBuilder.getNextAutoIncrement(instance, GET_NEXT_AUTO_INCREMENT);
        queryBuilder.execute(instance, CREATE, id, details.getCity(), details.getStreet(), details.getHome(), details.getApartment(), details.getEmail(), details.getPhone());
    }

    @Override
    public void update(ContactDetails details) {
        this.queryBuilder.execute(instance, UPDATE, details.getEmail(), details.getPhone(), details.getId());
    }

    @Override
    public void delete(long id) {
        this.queryBuilder.execute(instance, DELETE, id);
    }
}
