package ua.nure.zarazka.web.command.client;

import ua.nure.zarazka.Path;
import ua.nure.zarazka.db.entity.Account;
import ua.nure.zarazka.db.entity.ContactDetails;
import ua.nure.zarazka.db.entity.Tariff;
import ua.nure.zarazka.db.entity.User;
import ua.nure.zarazka.db.services.*;
import ua.nure.zarazka.utils.ReportBuilder;
import ua.nure.zarazka.web.command.ICommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @author A.Zarazka
 */
public class AccountCommand implements ICommand {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String forward = Path.PAGE_ACCOUNT;

        IUserService userService = new UserServiceImpl();
        IContactDetailsService detailsService = new ContactDetailsServiceImpl();
        IAccountService accountService = new AccountServiceImpl();
        ITariffService tariffService = new TariffServiceImpl();

        User fullUser = (User) session.getAttribute("user");
        fullUser.setRoleId(fullUser.getRoleId());
        fullUser.setDetails(detailsService.find(fullUser.getDetails().getId()));
        fullUser.setAccount(accountService.find(fullUser.getAccount().getId()));
        fullUser.setTariffs(new HashSet<>(userService.findUserTariffs(fullUser)));

        session.setAttribute("fullUser", fullUser);
        request.setAttribute("fullUser", fullUser);

        if (request.getParameter("tariff_id") != null) {
            printTariff(request, response, fullUser);
        }

        if (request.getParameter("account_balance") != null) {
            forward = topUpAccount(request, response, userService, accountService, fullUser);
        }

        if (request.getParameter("btnEmail") != null) {
            forward = changeEmail(request, response, detailsService, fullUser);
        }

        if (request.getParameter("btnPassword") != null) {
            forward = changePassword(request, response, userService, fullUser);
        }

        List<Tariff> internetTariffs = tariffService.findAllById(1);
        internetTariffs.sort(Comparator.comparingDouble(Tariff::getPrice));

        List<Tariff> iptvTariffs = tariffService.findAllById(2);
        iptvTariffs.sort(Comparator.comparingDouble(Tariff::getPrice));

        List<Tariff> telephonyTariffs = tariffService.findAllById(3);
        telephonyTariffs.sort(Comparator.comparingDouble(Tariff::getPrice));

        request.setAttribute("internetTariffs", internetTariffs);
        request.setAttribute("iptvTariffs", iptvTariffs);
        request.setAttribute("telephonyTariffs", telephonyTariffs);

        return forward;
    }

    private void printTariff(HttpServletRequest request, HttpServletResponse response, User user) {
        long tariffId = Long.parseLong(request.getParameter("tariff_id"));
        Set<Tariff> tariffs = user.getTariffs();
        for (Tariff tariff : tariffs) {
            if (tariff.getId() == tariffId) {
                ReportBuilder.tariffPDF(response, tariff);
            }
        }
    }

    private String topUpAccount(HttpServletRequest request, HttpServletResponse response, IUserService userService, IAccountService accountService, User user) {
        String resp = Path.COMMAND_ACCOUNT;
        double balance = Double.parseDouble(request.getParameter("account_balance"));
        double oldBalance = user.getAccount().getBalance();
        double newBalance = oldBalance + balance;
        Account account = user.getAccount();
        account.setBalance(newBalance);
        accountService.update(account);

        if (user.isBlocked() && user.getAccount().getBalance() > 0) {
            user.setBlocked(false);
            userService.update(user);
        }
        try {
            response.sendRedirect(resp);
            resp = Path.COMMAND_REDIRECT;
        } catch (IOException e) {
            resp = Path.PAGE_ERROR_PAGE;
        }
        return resp;
    }

    private String changeEmail(HttpServletRequest request, HttpServletResponse response, IContactDetailsService detailsService, User user) {
        String errorMessage;
        String resp = Path.COMMAND_ACCOUNT;
        String email = request.getParameter("inputEmail");
        if (email == null || email.isEmpty()) {
            errorMessage = "Email can't be empty";
            request.setAttribute("errorMessage", errorMessage);
        } else {
            ContactDetails detail = user.getDetails();
            detail.setEmail(email);
            detailsService.update(detail);
            resp = Path.PAGE_ACCOUNT;
            try {
                response.sendRedirect(resp);
                resp = Path.COMMAND_REDIRECT;
            } catch (IOException e) {
                resp = Path.PAGE_ERROR_PAGE;
            }
        }
        return resp;
    }

    private String changePassword(HttpServletRequest request, HttpServletResponse response, IUserService userService, User user) {
        String errorMessage;
        String resp = Path.COMMAND_ACCOUNT;
        String password = request.getParameter("inputPassword");
        if (password == null || password.isEmpty()) {
            errorMessage = "Password can't be empty";
            request.setAttribute("errorMessage", errorMessage);
            resp = Path.PAGE_ACCOUNT;
        } else {
            user.setPassword(password);
            userService.update(user);
            try {
                response.sendRedirect(resp);
                resp = Path.COMMAND_REDIRECT;
            } catch (IOException e) {
                resp = Path.PAGE_ERROR_PAGE;
            }
        }
        return resp;
    }
}