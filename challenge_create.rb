# Name        : Gilbert Lagman
# Date        : June 01, 2024
# Description : U3 - Active Record

# Load the ActiveRecord library
load 'ar.rb'

# Method 1: Create a new product and save it to the database in one step
product1 = Product.create(
  name: "Gadget 1",
  description: "High-tech gadget",
  price: 30.0,
  stock_quantity: 50
)

# Method 2: Create a new product object, set its attributes, and then save it to the database
product2 = Product.new # Create a new Product object
product2.name = "Tool 1" # Set the name attribute
product2.description = "Handy tool for everyday use" # Set the description attribute
product2.price = 40.0 # Set the price attribute
product2.stock_quantity = 20 # Set the stock quantity attribute
product2.save # Save the product to the database

# Method 3: Create a new product object with attributes, and then save it to the database
product3 = Product.new(
  name: "Accessory 1",
  description: "Stylish accessory",
  price: 10.0,
  stock_quantity: 100
)
product3.save # Save the product to the database

# Create a Product with Missing Required Columns
product_invalid = Product.new(
  name: "Item",
  description: "Incomplete item",
  price: nil # Missing price value
)

# Try to save the product, and check for errors if it fails
unless product_invalid.save
  puts "Errors: #{product_invalid.errors.full_messages.join(", ")}"
end
