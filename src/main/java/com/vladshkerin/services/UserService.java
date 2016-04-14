package com.vladshkerin.services;

import com.vladshkerin.exception.NotFoundUser;
import com.vladshkerin.models.User;

import java.util.GregorianCalendar;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * TODO: comment
 *
 * @author Vladimir Shkerin
 * @since 13.03.2016
 */
public class UserService {

    private static final UserService instance = new UserService();

    private final List<User> users = new CopyOnWriteArrayList<>();

    private UserService() {
        GregorianCalendar calendar1 = new GregorianCalendar(1985, 1, 2);
        GregorianCalendar calendar2 = new GregorianCalendar(1990, 3, 4);
        GregorianCalendar calendar3 = new GregorianCalendar(1995, 5, 6);
        String[] children1 = new String[]{"Ivan"};
        String[] children2 = new String[]{"Sviatoslav", "Eva"};
        String[] children3 = new String[]{"Maria", "Sergio", "Irina"};

        users.add(new User("00001", "Petr", 176.6f, calendar1, children1));
        users.add(new User("00002", "Erik", null, calendar2, children2));
        users.add(new User("00003", "Make", 160f, null, children3));
        users.add(new User("00004", "Nikita", 145.12f, calendar3, null));
        users.add(new User("00005", "Olga"));
    }

    public static UserService getInstance() {
        return instance;
    }

    public List<User> getAll() {
        return this.users;
    }

    public void add(final User user) {
        this.users.add(user);
    }

    public User get(String id) throws NotFoundUser {
        for (User user : users) {
            if (user.getId().equals(id)) {
                return user;
            }
        }
        throw new NotFoundUser("User not fount to \"id\"" + id);
    }

    public void delete(String id) {
        if (!id.isEmpty()) {
            try {
                users.remove(this.get(id));
            } catch (NotFoundUser e) {
                //TODO add out to log
                System.out.println(e.getMessage());
            }
        }
    }
}
