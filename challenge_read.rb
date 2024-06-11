# Name        : Gilbert Lagman
# Date        : June 01, 2024
# Description : U3 - Active Record

# Load the ActiveRecord library
require_relative 'ar.rb'

# Total number of products
number_of_products = Product.count
puts "There are #{number_of_products} products in the products table."

# Products above $10 with names beginning with 'C'
products_above_10 = Product.where('price > ? AND name LIKE ?', 10, 'C%')
puts "Products above $10 with names starting with 'C':"
products_above_10.each { |p| puts p.name }

# Products with low stock (less than 5)
low_stock_products = Product.where('stock_quantity < ?', 5)
puts "Low stock products count: #{low_stock_products.count}"

# Find the name of the category associated with the first product
product = Product.first
puts "The category for the product '#{product.name}' is '#{product.category.name}'."

# Create and persist a new product associated with a specific category without manually setting the foreign key
category = Category.find_by(name: 'Seafood')
new_product = category.products.build(
  name: 'Crab',
  description: 'Crabmeat',
  price: 29.99,
  stock_quantity: 10
)
new_product.save
puts "New product created: #{new_product.inspect}"

# Find all products of a specific category over a certain price
specific_category = Category.find_by(name: 'Seafood')
expensive_products = specific_category.products.where('price > ?', 25)
puts "Products in the 'Seafood' category priced over $25:"
expensive_products.each { |product| puts product.name }
