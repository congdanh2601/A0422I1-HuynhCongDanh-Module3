package service;

import model.Customer;

import java.util.List;

public interface IService<E> {
    boolean create(E e);

    boolean delete(int id);

    boolean update(E e);

    List<E> showAll();

    List findByName(String name);

    List<E> sortByName();

    List<Customer> showPage(int page);
}
