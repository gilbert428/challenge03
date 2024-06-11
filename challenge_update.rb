# Name        : Gilbert Lagman
# Date        : June 01, 2024
# Description : U3 - Active Record

# Load the ActiveRecord library
load 'ar.rb'

# Find products with a stock quantity greater than 40
products_to_update = Product.where('stock_quantity > ?', 40)

# Iterate over each product and increase its stock quantity by 5
products_to_update.each do |product|
  product.stock_quantity += 1
  product.save
end
