package ua.nure.zarazka.db.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * @author A.Zarazka
 */
public class PackageServices extends Entity {
    private static final long serialVersionUID = 1L;
    private String name;
    private String description;
    private Set<Tariff> tariffs;

    public PackageServices() {
        this.tariffs = new HashSet<>();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<Tariff> getTariffs() {
        return tariffs;
    }

    public void setTariffs(Set<Tariff> tariffs) {
        this.tariffs = tariffs;
    }
}
