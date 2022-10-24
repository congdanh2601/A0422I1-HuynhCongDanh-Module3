package repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private List<Product> productList = new ArrayList<>();
//
//    static {
//        productList.add(new Product(1, "iPhone 11", 500, "green", "iPhone"));
//        productList.add(new Product(2, "Asus 560", 700, "blue", "Asus"));
//        productList.add(new Product(3, "Airpods Pro", 150, "white", "iPhone"));
//    }



    @Override
    public List findAll() {
        productList.add(new Product(1, "iPhone 11", 500, "green", "iPhone"));
        productList.add(new Product(2, "Asus 560", 700, "blue", "Asus"));
        productList.add(new Product(3, "iPhone 14 Pro", 3000, "purple", "iPhone"));
        productList.add(new Product(4, "Airpods Pro", 150, "white", "iPhone"));
        productList.add(new Product(5, "Samsung Galaxy Z Fold", 2900, "Silver", "Samsung"));
        return productList;
    }

    @Override
    public boolean save(Product product) {
        return productList.add(product);
    }

    @Override
    public void update(int id, Product p) {

    }

    @Override
    public boolean remove(int id) {
        for (Product p : productList) {
            if (p.getId() == id) {
                return productList.remove(p);
            }
        }
        return false;
    }

    @Override
    public Product findById(int id) {
        for (Product p : productList) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }

    @Override
    public Product findByName(String name) {
        for (Product p : productList) {
            if (p.getName().equals(name)) {
                return p;
            }
        }
        return null;
    }
}
