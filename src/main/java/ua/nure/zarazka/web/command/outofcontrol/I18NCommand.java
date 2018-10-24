package ua.nure.zarazka.web.command.outofcontrol;

import ua.nure.zarazka.Path;
import ua.nure.zarazka.web.command.ICommand;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.jstl.core.Config;

/**
 * @author A.Zarazka
 */
public class I18NCommand implements ICommand {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();

        String fmtLocale = "javax.servlet.jsp.jstl.fmt.locale";
        String defaultLocale = "defaultLocale";

        if (request.getParameter("ru") != null) {
            Config.set(session, fmtLocale, Path.LOCALE_NAME_RU);
            session.setAttribute(defaultLocale, "ru");

        } else {
            Config.set(session, fmtLocale, "en");
            session.setAttribute(defaultLocale, Path.LOCALE_NAME_EN);
        }

        return Path.PAGE_INDEX;
    }
}