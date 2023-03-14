package tech.luijben.recappt.models;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;
import java.util.*;

@Entity(name = "recipes")
public class Recipe {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private long id;
    @CreationTimestamp
    private Timestamp createdAt;
    private String title;
    private String description;
    private Integer servingsPeople;
    private Integer servingsPieces;
    private int timePrepInMinutes;
    private int timeWaitInMinutes;
    private int timeOvenInMinutes;
    private String comment;
    private String imageName;
    @OneToMany(mappedBy="recipe")
    private List<RecipeStep> steps;
    @OneToMany(mappedBy="recipe")
    private List<RecipeIngredient> ingredients;
    @ManyToMany
    @JoinTable(
            name = "recipe_category",
            joinColumns = @JoinColumn(name = "recipe_id"),
            inverseJoinColumns = @JoinColumn(name = "category_id"))
    private List<Category> categories;

    protected Recipe() {
    }

    public Recipe(long id, Timestamp createdAt, String title, String description, Integer servingsPeople, Integer servingsPieces, int timePrepInMinutes, int timeWaitInMinutes, int timeOvenInMinutes, String comment, String imageName, List<RecipeStep> steps, List<RecipeIngredient> ingredients, List<Category> categories) {
        this.id = id;
        this.createdAt = createdAt;
        this.title = title;
        this.description = description;
        this.servingsPeople = servingsPeople;
        this.servingsPieces = servingsPieces;
        this.timePrepInMinutes = timePrepInMinutes;
        this.timeWaitInMinutes = timeWaitInMinutes;
        this.timeOvenInMinutes = timeOvenInMinutes;
        this.comment = comment;
        this.imageName = imageName;
        this.steps = steps;
        this.ingredients = ingredients;
        this.categories = categories;
    }

    public Long getId() {
        return id;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public Integer getServingsPeople() {
        return servingsPeople;
    }

    public Integer getServingsPieces() {
        return servingsPieces;
    }

    public int getTimePrepInMinutes() {
        return timePrepInMinutes;
    }

    public int getTimeWaitInMinutes() {
        return timeWaitInMinutes;
    }

    public int getTimeOvenInMinutes() {
        return timeOvenInMinutes;
    }

    public String getComment() {
        return comment;
    }

    public List<RecipeStep> getSteps() {
        steps.sort(Comparator.comparingInt(RecipeStep::getNumber));
        return steps;
    }

    public String getImageName() {
        return imageName;
    }

    public List<RecipeIngredient> getIngredients() {
        return ingredients;
    }

    public List<Category> getCategories() {
        return categories;
    }

    @Override
    public String toString() {
        return "Recipe{" +
                "id=" + id +
                ", title='" + title + '\'' +
                '}';
    }
}
