package ua.nure.zarazka.web.command.admin;

import ua.nure.zarazka.Path;
import ua.nure.zarazka.db.entity.User;
import ua.nure.zarazka.db.services.*;
import ua.nure.zarazka.web.command.ICommand;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashSet;

/**
 * @author A.Zarazka
 */
public class EditClientICommand implements ICommand {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        long id = Long.parseLong(request.getParameter("user_id"));
        String forward = Path.COMMAND_MAIN;

        IUserService userService = new UserServiceImpl();
        IContactDetailsService detailsService = new ContactDetailsServiceImpl();
        IAccountService accountService = new AccountServiceImpl();

        User user;
        if (id != 0) {
            user = userService.find(id);
            user.setRoleId(user.getRoleId());
            user.setDetails(detailsService.find(user.getDetails().getId()));
            user.setAccount(accountService.find(user.getAccount().getId()));
            user.setTariffs(new HashSet<>(userService.findUserTariffs(user)));

            ServletContext servletContext = request.getServletContext();
            servletContext.setAttribute("user_id", user.getId());
        } else {
            HttpSession session = request.getSession();
            user = (User) session.getAttribute("newUser");
        }

        if (request.getParameter("btnLock") != null) {
            forward = blockUser(response, userService, user);
        }

        if (request.getParameter("btnChangeUser") != null) {
            forward = update(request, response, userService, user);
        }

        if (request.getParameter("btnBack") != null) {
            forward = goBack(request, response);
        }
        return forward;
    }

    private String update(HttpServletRequest request, HttpServletResponse response, IUserService userService, User user) {
        String resp = Path.COMMAND_PROFILE;
        String surname = request.getParameter("surname");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String[] trafficsId = request.getParameterValues("arrTrafficsId");

        user.setSurname(surname);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        userService.update(user);
        userService.removeLinksUsersHasTariffs(user);
        if (trafficsId != null) {
            userService.saveLinksUsersHasTariffs(user, trafficsId);
        }
        HttpSession session = request.getSession();
        session.removeAttribute("newUser");
        session.setAttribute("newUser", user);
        try {
            response.sendRedirect(resp);
            resp = Path.COMMAND_REDIRECT;
        } catch (IOException e) {
            resp = Path.PAGE_ERROR_PAGE;
        }
        return resp;
    }

    private String blockUser(HttpServletResponse response, IUserService userService, User user) {
        String resp = Path.COMMAND_MAIN;
        if (user.isBlocked()) {
            user.setBlocked(false);
            userService.update(user);
        } else {
            user.setBlocked(true);
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

    private String goBack(HttpServletRequest request, HttpServletResponse response) {
        String resp = Path.COMMAND_MAIN;
        HttpSession session = request.getSession();
        session.removeAttribute("newUser");

        ServletContext servletContext = request.getServletContext();
        servletContext.removeAttribute("user_id");
        try {
            response.sendRedirect(resp);
            resp = Path.COMMAND_REDIRECT;
        } catch (IOException e) {
            resp = Path.PAGE_ERROR_PAGE;
        }
        return resp;
    }
}