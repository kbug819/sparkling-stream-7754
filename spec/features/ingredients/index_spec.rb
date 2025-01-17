require "rails_helper"

RSpec.describe "the ingredients index" do
  it "shows a list of ingredients and their costs" do
    ingredient_1 = Ingredient.create(name: "Pasta", cost: 2)
    ingredient_2 = Ingredient.create(name: "Pasta Sauce", cost: 4)
    
    visit "/ingredients/"

    expect(page).to have_content("All Ingredients and Costs")
    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_1.cost)
    expect(page).to have_content(ingredient_2.name)
    expect(page).to have_content(ingredient_2.cost)
  end

  it "shows a list of ingredients sorted alphabetically" do
    ingredient_2 = Ingredient.create(name: "Pasta Sauce", cost: 4)
    ingredient_1 = Ingredient.create(name: "Pasta", cost: 2)
    ingredient_3 = Ingredient.create(name: "Apple", cost: 2)
    
    visit "/ingredients/"

    expect(ingredient_3.name).to appear_before(ingredient_2.name)
    expect(ingredient_1.name).to appear_before(ingredient_2.name)
  end
end