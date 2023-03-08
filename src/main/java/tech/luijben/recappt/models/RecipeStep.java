package tech.luijben.recappt.models;

import jakarta.persistence.*;

@Entity(name = "recipe_steps")
public class RecipeStep {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private long id;
    private int number;
    private String description;

    @ManyToOne
    @JoinColumn(name="recipe_id", nullable=false)
    private Recipe recipe;

    protected RecipeStep() {
    }

    public RecipeStep(long id, int number, String description) {
        this.id = id;
        this.number = number;
        this.description = description;
    }

    public long getId() {
        return id;
    }

    public int getNumber() {
        return number;
    }

    public String getDescription() {
        return description;
    }
}
