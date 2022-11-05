package repository;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    Connection connection = BaseRepository.getConnectDB();
    private final String SELECT_ALL = "select * from users;";
    private final String SELECT_BY_ID = "select * from users where id = ?;";
    private final String INSERT_USER = "insert into users(name, email, country) values(?, ?, ?);";
    private final String DELETE_USER_BY_ID = "delete from users where id = ?;";
    private final String UPDATE_USER = "update users set name = ?, email = ?, country = ? where id = ?;";
    private final String FIND_BY_COUNTRY = "select * from users where country = ?;";
    private final String SORT_BY_NAME = "select * from users order by name;";
    private final String CALL_DISPLAY_USERS = "call display_users;";
    private final String CALL_UPDATE_USER = "call update_user_with_id(?, ?, ?, ?);";
    PreparedStatement ps;

    @Override
    public void insertUser(User user) {
        try {
            ps = connection.prepareStatement(INSERT_USER);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getCountry());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public User selectUser(int id) {
        try {
            ps = connection.prepareStatement(SELECT_BY_ID);
            ps.setInt(1, id);
            ResultSet resultSet = ps.executeQuery();
            resultSet.next();
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String country = resultSet.getString("country");

            User user = new User(id, name, email, country);
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<User> selectAllUsers() {
        try {
            ps = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = ps.executeQuery();
            List<User> list = new ArrayList<>();
            return getList(list, resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean deleteUser(int id) {
        try {
            ps = connection.prepareStatement(DELETE_USER_BY_ID);
            ps.setInt(1, id);
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateUser(User user) {
        try {
            ps = connection.prepareStatement(UPDATE_USER);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getCountry());
            ps.setInt(4, user.getId());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<User> findByCountry(String country) {
        List list = new ArrayList();
        try {
            ps = connection.prepareStatement(FIND_BY_COUNTRY);
            ps.setString(1, country);
            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id"); //id,name,email,country
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                list.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<User> sortByName() {
        List<User> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(SORT_BY_NAME);
            ResultSet resultSet = ps.executeQuery();
            return getList(list, resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<User> getList(List<User> list, ResultSet resultSet) throws SQLException {
        while (resultSet.next()) {
            int id = resultSet.getInt("id"); //id,name,email,country
            String name = resultSet.getString("name");
            String email = resultSet.getString("email");
            String country = resultSet.getString("country");
            list.add(new User(id, name, email, country));
        }
        return list;
    }

    public List<User> callList() {
        List<User> list = new ArrayList<>();
        try {
            ps = connection.prepareStatement(CALL_DISPLAY_USERS);
            ResultSet resultSet = ps.executeQuery();
            return getList(list, resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean callUpdate(User user) {
        try {
            ps = connection.prepareStatement(CALL_UPDATE_USER);
            ps.setInt(1, user.getId());
            ps.setString(2, user.getName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getCountry());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean callDelete(int id) {
        try {
            ps = connection.prepareStatement(DELETE_USER_BY_ID);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
