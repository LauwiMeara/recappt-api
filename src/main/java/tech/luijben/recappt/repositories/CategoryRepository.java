package tech.luijben.recappt.repositories;

import org.springframework.data.repository.CrudRepository;
import tech.luijben.recappt.models.Category;

public interface CategoryRepository extends CrudRepository<Category, Long> {
    Iterable<Category> findAllByOrderByNumberAsc();
}
