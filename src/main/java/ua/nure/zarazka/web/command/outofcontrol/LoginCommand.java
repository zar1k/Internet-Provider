package ua.nure.zarazka.web.command.outofcontrol;

import ua.nure.zarazka.Path;
import ua.nure.zarazka.db.entity.Role;
import ua.nure.zarazka.db.entity.User;
import ua.nure.zarazka.db.services.IUserService;
import ua.nure.zarazka.db.services.UserServiceImpl;
import ua.nure.zarazka.web.command.ICommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author A.Zarazka
 */
public class LoginCommand implements ICommand {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        String login = request.getParameter("login");
        String password = request.getParameter("password");

        // error handler
        String errorMessage;
        String forward = Path.PAGE_LOGIN;

        if (login == null || password == null || login.isEmpty() || password.isEmpty()) {
            errorMessage = "Login or password can't be empty";
            request.setAttribute("errorMessage", errorMessage);
            return forward;
        }

        IUserService service = new UserServiceImpl();
        User user = service.findByLogin(login);

        if (user == null || !password.equals(user.getPassword())) {
            errorMessage = "Cannot find user with such login or password";
            request.setAttribute("errorMessage", errorMessage);
            return forward;
        } else {
            Role userRole = Role.getRole(user);

            if(userRole == Role.ADMIN){
                forward = Path.COMMAND_MAIN;
            }

            if (userRole == Role.CLIENT){
                forward = Path.COMMAND_ACCOUNT;
            }

            session.setAttribute("user", user);
            session.setAttribute("userRole", userRole);
        }
        return forward;
    }
}
