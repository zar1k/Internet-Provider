package ua.nure.zarazka.db.repository;

import ua.nure.zarazka.db.entity.Tariff;

import java.util.List;

/**
 * @author A.Zarazka
 */
public interface ITariff extends IEntity<Tariff> {

    List<Tariff> getAllByServiceId(long id);

    Tariff getByName(String name);
}
