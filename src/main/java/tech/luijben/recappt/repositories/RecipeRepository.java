package tech.luijben.recappt.repositories;

import org.springframework.data.repository.CrudRepository;
import tech.luijben.recappt.models.Recipe;

public interface RecipeRepository extends CrudRepository<Recipe, Long> {
    Recipe findById(long id);
}
