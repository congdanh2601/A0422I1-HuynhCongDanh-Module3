package service;

import model.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface IUserService {
    void insertUser(User user);

    User selectUser(int id);

    List<User> selectAllUsers();

    boolean deleteUser(int id);

    boolean updateUser(User user);

    List<User> findByCountry(String country);

    List<User> sortByName();

    public List<User> callList();
}
