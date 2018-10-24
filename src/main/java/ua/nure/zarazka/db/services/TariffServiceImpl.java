package ua.nure.zarazka.db.services;

import ua.nure.zarazka.db.entity.Tariff;
import ua.nure.zarazka.db.repository.ITariff;
import ua.nure.zarazka.db.repository.TariffImpl;

import java.util.List;

/**
 * @author A.Zarazka
 */
public class TariffServiceImpl implements ITariffService {
    private final ITariff repo = new TariffImpl();

    @Override
    public List<Tariff> findAll() {
        return this.repo.getAll();
    }

    @Override
    public Tariff find(long id) {
        return this.repo.getById(id);
    }

    @Override
    public Tariff find(String name) {
        return this.repo.getByName(name);
    }

    @Override
    public List<Tariff> findAllById(long id) {
        return this.repo.getAllByServiceId(id);
    }

    @Override
    public void save(Tariff tariff) {
        this.repo.create(tariff);
    }

    @Override
    public void update(Tariff tariff) {
        this.repo.update(tariff);
    }

    @Override
    public void remove(long id) {
        this.repo.delete(id);
    }
}
