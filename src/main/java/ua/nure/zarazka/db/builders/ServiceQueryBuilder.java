package ua.nure.zarazka.db.builders;

import ua.nure.zarazka.db.entity.PackageServices;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author A.Zarazka
 */
public class ServiceQueryBuilder extends QueryBuilder<PackageServices> {
    @Override
    public List<PackageServices> getListOfResult(ResultSet rs) throws SQLException {
        List<PackageServices> services = new ArrayList<>();
        while (rs.next()) {
            PackageServices packageServices = new PackageServices();
            packageServices.setId(rs.getLong("id"));
            packageServices.setName(rs.getString("name"));
            packageServices.setDescription(rs.getString("description"));
            services.add(packageServices);
        }
        return services;
    }

    @Override
    public PackageServices getResult(ResultSet rs) throws SQLException {
        PackageServices packageService = new PackageServices();
        while (rs.next()) {
            packageService.setId(rs.getLong("id"));
            packageService.setName(rs.getString("name"));
            packageService.setDescription(rs.getString("description"));

        }
        return packageService;
    }
}
