# Name        : Gilbert Lagman
# Date        : June 01, 2024
# Description : U3 - Active Record

# Load the ActiveRecord library
load 'ar.rb'

# Find the product to delete by name
product_to_delete = Product.find_by(name: "Gadget 1")

# Delete the product if it exists
product_to_delete.destroy if product_to_delete

# Verify that the product no longer exists in the database
product_check = Product.find_by(name: "Gadget 1")
puts "Product still exists in database: #{!product_check.nil?}"

# Inspect the in-memory object
puts product_to_delete.inspect
