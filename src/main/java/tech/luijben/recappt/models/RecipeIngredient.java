package tech.luijben.recappt.models;

import jakarta.persistence.*;

@Entity(name = "recipe_ingredients")
public class RecipeIngredient {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private long id;
    private double amount;
    private String unitOfMeasurement;
    private String name;
    private String description;

    @ManyToOne
    @JoinColumn(name="recipe_id", nullable=false)
    private Recipe recipe;

    protected RecipeIngredient(){
    }

    public RecipeIngredient(long id, double amount, String unitOfMeasurement, String name, String description) {
        this.id = id;
        this.amount = amount;
        this.unitOfMeasurement = unitOfMeasurement;
        this.name = name;
        this.description = description;
    }

    public long getId() {
        return id;
    }

    public double getAmount() {
        return amount;
    }

    public String getUnitOfMeasurement() {
        return unitOfMeasurement;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }
}
