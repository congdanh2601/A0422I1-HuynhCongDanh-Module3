package service;

import model.Customer;
import repository.CustomerRepository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerService implements IService<Customer> {
    CustomerRepository repository = new CustomerRepository();
    Map<String, String> error = new HashMap();
    @Override
    public boolean create(Customer customer) {
        return repository.create(customer);
    }

    @Override
    public boolean delete(int id) {
        return repository.delete(id);
    }

    @Override
    public boolean update(Customer customer) {
        return repository.update(customer);
    }

    @Override
    public List<Customer> showAll() {
        return repository.showAll();
    }

    public List<Customer> showPage(int page) {
        return repository.showPage(page);
    }

    @Override
    public List findByName(String name) {
        return repository.findByName(name);
    }

    public List<Customer> getCustomerType() {
        return repository.getCustomerType();
    }

    public List<Customer> sortByName() {
        return repository.sortByName();
    }
}
