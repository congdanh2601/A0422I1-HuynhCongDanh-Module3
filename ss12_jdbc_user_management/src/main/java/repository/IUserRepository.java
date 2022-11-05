package repository;

import model.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    void insertUser(User user);

    User selectUser(int id);

    List<User> selectAllUsers();

    boolean deleteUser(int id);

    boolean updateUser(User user);

    List<User> findByCountry(String country);

    List<User> sortByName();

    List<User> getList(List<User> list, ResultSet resultSet) throws SQLException;

    List<User> callList();

    boolean callUpdate(User user);

    boolean callDelete(int id);
}
