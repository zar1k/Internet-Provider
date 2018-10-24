package ua.nure.zarazka.web.command.admin;

import ua.nure.zarazka.Path;
import ua.nure.zarazka.db.entity.*;
import ua.nure.zarazka.db.services.*;
import ua.nure.zarazka.web.command.ICommand;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * @author A.Zarazka
 */
public class RegistrationCommand implements ICommand {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String firstName = request.getParameter("firstName").trim();
        String lastName = request.getParameter("lastName").trim();
        String surname = request.getParameter("surname").trim();

        String city = request.getParameter("city").trim();
        String street = request.getParameter("street").trim();
        String home = request.getParameter("home").trim();
        String apartment = request.getParameter("apartment").trim();
        String email = request.getParameter("email").trim();
        String phone = request.getParameter("phone").trim();

        String[] trafficsId = request.getParameterValues("arrTrafficsId");

        IUserService userService = new UserServiceImpl();
        IContactDetailsService detailsService = new ContactDetailsServiceImpl();
        IAccountService accountService = new AccountServiceImpl();
        ITariffService tariffService = new TariffServiceImpl();

        ContactDetails details = new ContactDetails();
        details.setCity(city);
        details.setStreet(street);
        details.setHome(home);
        details.setApartment(apartment);
        details.setEmail(email);
        details.setPhone(phone);
        detailsService.save(details);

        Account account = new Account();
        account.setNumber(accountService.getNumberContract());
        account.setBalance(0);
        accountService.save(account);

        Set<Tariff> tariffs;
        if (trafficsId != null) {
            tariffs = new HashSet<>();
            for (String item : trafficsId) {
                tariffs.add(tariffService.find(Long.parseLong(item)));
            }
        } else {
            tariffs = Collections.emptySet();
        }

        User newUser = new User();
        newUser.setLogin(details.getPhone());
        newUser.setPassword(String.valueOf(account.getNumber()));
        newUser.setSurname(surname);
        newUser.setFirstName(firstName);
        newUser.setLastName(lastName);
        newUser.setRoleId(2);
        newUser.setBlocked(true);
        newUser.setDetails(details);
        newUser.setAccount(account);
        newUser.setTariffs(tariffs);
        userService.save(newUser);

        if (trafficsId != null) {
            userService.saveLinksUsersHasTariffs(newUser, trafficsId);
        }

        HttpSession session = request.getSession();
        session.setAttribute("newUser", newUser);

        String resp = Path.COMMAND_PROFILE;
        try {
            response.sendRedirect(resp);
            resp = Path.COMMAND_REDIRECT;
        } catch (IOException e) {
            resp = Path.PAGE_ERROR_PAGE;
        }
        return resp;
    }
}
