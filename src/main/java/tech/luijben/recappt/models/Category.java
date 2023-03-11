package tech.luijben.recappt.models;

import jakarta.persistence.*;

import java.util.Set;

@Entity(name="categories")
public class Category {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private long id;
    private String name;
    private int number;
    private String iconName;
    @ManyToMany(mappedBy="categories")
    private Set<Recipe> recipes;

    protected Category() {
    }

    public Category(long id, String name, int number, String iconName, Set<Recipe> recipes) {
        this.id = id;
        this.name = name;
        this.number = number;
        this.iconName = iconName;
        this.recipes = recipes;
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getNumber() {
        return number;
    }

    public String getIconName() {
        return iconName;
    }
}


