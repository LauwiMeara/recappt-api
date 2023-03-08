package tech.luijben.recappt.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tech.luijben.recappt.models.Recipe;
import tech.luijben.recappt.repositories.RecipeRepository;

@RestController
@RequestMapping(path="/recipes")
public class RecipeController {
    @Autowired
    private RecipeRepository recipeRepository;

    @CrossOrigin(origins="http://localhost:4200")
    @GetMapping()
    public Iterable<Recipe> getRecipes() {
        return recipeRepository.findAll();
    }

    @CrossOrigin(origins="http://localhost:4200")
    @GetMapping(value="/{id}")
    public Recipe getRecipe(@PathVariable long id) {
        return recipeRepository.findById(id);
    }

    @PostMapping
    public void addRecipe(@RequestBody Recipe recipe) {
        recipeRepository.save(recipe);
    }
}
