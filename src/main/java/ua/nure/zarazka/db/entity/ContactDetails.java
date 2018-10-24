package ua.nure.zarazka.db.entity;

/**
 * @author A.Zarazka
 */
public class ContactDetails extends Entity {
    private static final long serialVersionUID = 1L;
    private String city;
    private String street;
    private String home;
    private String apartment;
    private String email;
    private String phone;

    public ContactDetails() {
        super();
    }

    public ContactDetails(long id) {
        super(id);
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getHome() {
        return home;
    }

    public void setHome(String home) {
        this.home = home;
    }

    public String getApartment() {
        return apartment;
    }

    public void setApartment(String apartment) {
        this.apartment = apartment;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
