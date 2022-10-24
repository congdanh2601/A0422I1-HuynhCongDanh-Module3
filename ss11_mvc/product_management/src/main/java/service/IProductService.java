package service;

import model.Product;

import java.util.List;

public interface IProductService {
    //Hiển thị danh sách sản phẩm
    List findAll();

    //Tạo sản phẩm mới
    boolean save(Product product);

    //Cập nhật thông tin sản phẩm
    void update(int id, Product p);

    //Xoá một sản phẩm
    boolean remove(int id);

    //Xem chi tiết một sản phẩm
    Product findById(int id);

    //Tìm kiếm sản phẩm theo tên
    Product findByName(String name);
}
