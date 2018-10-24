package ua.nure.zarazka;

public final class Path {
    // pages
    public static final String PAGE_INDEX = "/index.jsp";
    public static final String PAGE_LOGIN = "/login.jsp";
    public static final String PAGE_ERROR_PAGE = "/WEB-INF/jsp/error_page.jsp";
    public static final String PAGE_MAIN = "/WEB-INF/jsp/admin/main.jsp";
    public static final String PAGE_PROFILE = "/WEB-INF/jsp/admin/profile.jsp";
    public static final String PAGE_ACCOUNT = "/WEB-INF/jsp/client/account.jsp";

    // common commands
    public static final String COMMAND_LOGIN = "controller?action=login";
    public static final String COMMAND_LOGOUT = "controller?action=logout";
    public static final String COMMAND_PDF_BUILDER = "controller?action=pdf_builder";
    public static final String COMMAND_NO_COMMAND = "controller?action=no_command";
    public static final String COMMAND_I18N = "controller?action=i18n";
    public static final String COMMAND_REDIRECT = "redirect";

    // admin commands
    public static final String COMMAND_MAIN = "controller?action=main";
    public static final String COMMAND_REGISTRATION = "controller?action=registration";
    public static final String COMMAND_EDIT_CLIENT = "controller?action=edit_client";
    public static final String COMMAND_PROFILE = "controller?action=profile";
    public static final String COMMAND_ADD_TARIFF = "controller?action=add_tariff";
    public static final String COMMAND_EDIT_TARIFF = "controller?action=edit_tariff";
    public static final String COMMAND_REMOVE_TARIFF = "controller?action=remove_tariff";

    // client commands
    public static final String COMMAND_ACCOUNT = "controller?action=account";
    public static final String COMMAND_PERSONAL_DATA = "controller?action=personal_data";

    // i18n
    public static final String LOCALE_NAME_RU = "ru";
    public static final String LOCALE_NAME_EN = "en";
}
