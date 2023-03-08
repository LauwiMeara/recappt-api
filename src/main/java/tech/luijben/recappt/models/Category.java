package tech.luijben.recappt.models;

import jakarta.persistence.*;

import java.util.Set;

@Entity(name="categories")
public class Category {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private long id;
    private String name;
    @ManyToMany(mappedBy="categories")
    private Set<Recipe> recipes;

    protected Category() {
    }

    public Category(long id, Set<Recipe> recipes) {
        this.id = id;
        this.recipes = recipes;
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}


