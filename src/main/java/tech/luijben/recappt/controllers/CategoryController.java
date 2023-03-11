package tech.luijben.recappt.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tech.luijben.recappt.models.Category;
import tech.luijben.recappt.repositories.CategoryRepository;

@RestController
@RequestMapping(path="/categories")
public class CategoryController {
    @Autowired
    private CategoryRepository categoryRepository;

    @CrossOrigin(origins="http://localhost:4200")
    @GetMapping()
    public Iterable<Category> getCategories() {
        return categoryRepository.findAllByOrderByNumberAsc();
    }
}
