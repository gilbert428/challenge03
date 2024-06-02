# Name        : Gilbert Lagman
# Date        : June 01, 2024
# Description : U3 - Active Record

# Load the ActiveRecord library
require_relative 'ar.rb'


# Use Faker's unique method to generate unique category names
10.times do
  begin
    # Generate a unique category name using Faker
    category_name = Faker::Commerce.unique.department
  end while Category.exists?(name: category_name) # Ensure the category name is unique in the database

  # Create a new category with the unique name
  category = Category.create(name: category_name)

  # Use Faker's unique method to generate unique product names
  10.times do
    begin
      # Generate a unique product name using Faker
      product_name = Faker::Commerce.unique.product_name
    end while Product.exists?(name: product_name) # Ensure the product name is unique in the database

    # Create a new product with the unique name and random details
    category.products.create(
      name: product_name,
      description: Faker::Lorem.sentence, # Generate a random sentence for the description
      price: Faker::Commerce.price, # Generate a random price
      stock_quantity: rand(1..100) # Generate a random stock quantity between 1 and 100
    )
  end
end

# Clear Faker's unique generator after usage to prevent memory bloat
Faker::UniqueGenerator.clear
