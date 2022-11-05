package service;

import model.User;
import repository.IUserRepository;
import repository.UserRepository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    IUserRepository repository = new UserRepository();
    @Override
    public void insertUser(User user) {
        repository.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return repository.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return repository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) {
        return repository.callDelete(id);
    }

    @Override
    public boolean updateUser(User user) {
        return repository.callUpdate(user);
    }

    public List<User> findByCountry(String country) {
        return repository.findByCountry(country);
    }

    public List<User> sortByName() {
        return repository.sortByName();
    }

    public List<User> callList() {
        return repository.callList();
    }
}
