package repository;

import model.Customer;
import repository.BaseRepository;
import repository.IRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements IRepository<Customer> {
    private final String ADD_CUSTOMER = "insert into customer(customer_type_id, customer_name, customer_birthday, " +
            "customer_gender, customer_id_card, customer_phone, customer_email, customer_address)\n" +
            "values (?,?,?,?,?,?,?,?);";
    private final String DELETE_CUSTOMER = "delete from customer where customer_id = ?;";
    private final String UPDATE_CUSTOMER = "update customer set customer_type_id = ?, customer_name = ?, customer_birthday = ?, customer_gender = ?," +
            "customer_id_card = ?, customer_phone = ?, customer_email = ?, customer_address = ? where customer_id = ?;";
    private final String SHOW_ALL_CUSTOMER = "select * from customer c join customer_type ct using (customer_type_id) order by customer_id;";
    private final String SHOW_PAGE_CUSTOMER = "select * from customer c join customer_type ct using (customer_type_id) order by customer_id limit ?,5;";
    private final String SHOW_ALL_CUSTOMER_TYPE = "select * from customer c right join customer_type ct using (customer_type_id) group by customer_type_id;";
    private final String FIND_CUSTOMER_BY_NAME = "select * from customer c join customer_type ct using (customer_type_id) where customer_name like ?;";
    private final String FIND_CUSTOMER_TYPE_ID = "select customer_type_id from customer_type where customer_type_name = ?";
    private final String SORT_CUSTOMER_BY_NAME = "select * from customer c join customer_type ct using (customer_type_id) order by customer_name";

    Connection connection = BaseRepository.getConnectDB();
    PreparedStatement ps = null;

    @Override
    public boolean create(Customer customer) {
        try {
            ps = connection.prepareStatement(ADD_CUSTOMER);
            setCustomers(customer);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        try {
            ps = connection.prepareStatement(DELETE_CUSTOMER);
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean update(Customer customer) {
        try {
            ps = connection.prepareStatement(UPDATE_CUSTOMER);
            setCustomers(customer);
            ps.setInt(9, customer.getCustomerId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Customer> showAll() {
        List<Customer> customerList = new ArrayList<>();
        try {
            ps = connection.prepareStatement(SHOW_ALL_CUSTOMER);
            ResultSet resultSet = ps.executeQuery();
            customerList = getCustomers(resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    public List<Customer> showPage(int page) {
        List<Customer> customerList = new ArrayList<>();
        try {
            ps = connection.prepareStatement(SHOW_PAGE_CUSTOMER);
            ps.setInt(1, (page-1) * 5);
            ResultSet resultSet = ps.executeQuery();
            customerList = getCustomers(resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public List findByName(String name) {
        List<Customer> customerList = new ArrayList<>();
        try {
            ps = connection.prepareStatement(FIND_CUSTOMER_BY_NAME);
            ps.setString(1, "%" + name + "%");
            ResultSet resultSet = ps.executeQuery();
            customerList = getCustomers(resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    public List<Customer> getCustomerType() {
        List<Customer> customerList = new ArrayList<>();
        try {
            ps = connection.prepareStatement(SHOW_ALL_CUSTOMER_TYPE);
            ResultSet resultSet = ps.executeQuery();
            customerList = getCustomers(resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    public List<Customer> sortByName() {
        List<Customer> customerList = new ArrayList<>();
        try {
            ps = connection.prepareStatement(SORT_CUSTOMER_BY_NAME);
            ResultSet resultSet = ps.executeQuery();
            customerList = getCustomers(resultSet);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    private List<Customer> getCustomers(ResultSet resultSet) throws SQLException {
        List<Customer> customerList = new ArrayList<>();
        while (resultSet.next()) {
            //customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address
            int id = resultSet.getInt("customer_id");
            String type = resultSet.getString("customer_type_name");
            String name = resultSet.getString("customer_name");
            String birthday = resultSet.getString("customer_birthday");
            boolean gender = resultSet.getBoolean("customer_gender");
            String nationalId = resultSet.getString("customer_id_card");
            String phone = resultSet.getString("customer_phone");
            String email = resultSet.getString("customer_email");
            String address = resultSet.getString("customer_address");
            Customer customer = new Customer(id, type, name, birthday, gender, nationalId, phone, email, address);
            customerList.add(customer);
        }
        return customerList;
    }

    private void setCustomers(Customer customer) {
        try {
            PreparedStatement ps2 = connection.prepareStatement(FIND_CUSTOMER_TYPE_ID);
            ps2.setString(1, customer.getCustomerType());
            ResultSet rs2 = ps2.executeQuery();
            rs2.next();
            int customerTypeId = rs2.getInt(1);
            ps.setInt(1, customerTypeId);
            ps.setString(2, customer.getCustomerName());
            ps.setDate(3, Date.valueOf(customer.getCustomerBirthday()));
            ps.setBoolean(4, customer.isCustomerGender());
            ps.setString(5, customer.getCustomerIdCard());
            ps.setString(6, customer.getCustomerPhone());
            ps.setString(7, customer.getCustomerEmail());
            ps.setString(8, customer.getCustomerAddress());
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
