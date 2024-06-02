# Name        : Gilbert Lagman
# Date        : June 01, 2024
# Description : U3 - Active Record

require_relative 'ar.rb'

Category.includes(:products).find_each do |category|
  puts "Category: #{category.name}"
  category.products.each do |product|
    puts "  - Product: #{product.name}, Price: #{product.price}"
  end
end
