package repository;

import model.Customer;

import java.util.List;

public interface IRepository<E> {
    boolean create(E E);

    boolean delete(int id);

    boolean update(E e);

    List<E> showAll();

    List findByName(String name);

    List<E> sortByName();

    List<Customer> showPage(int page);
}
