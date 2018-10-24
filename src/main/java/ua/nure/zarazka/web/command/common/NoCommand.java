package ua.nure.zarazka.web.command.common;

import ua.nure.zarazka.Path;
import ua.nure.zarazka.web.command.ICommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author A.Zarazka
 */
public class NoCommand implements ICommand {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String errorMessage = "No such command";
        request.setAttribute("errorMessage", errorMessage);
        return Path.PAGE_ERROR_PAGE;
    }
}
