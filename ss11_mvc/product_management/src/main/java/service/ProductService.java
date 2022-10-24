package service;

import model.Product;
import repository.IProductRepository;
import repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();


    @Override
    public List findAll() {
        return productRepository.findAll();
    }

    @Override
    public boolean save(Product product) {
        return productRepository.save(product);
    }

    @Override
    public void update(int id, Product p) {

    }

    @Override
    public boolean remove(int id) {
        return productRepository.remove(id);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public Product findByName(String name) {
        return productRepository.findByName(name);
    }
}
