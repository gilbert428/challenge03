class Product < ActiveRecord::Base
  # This AR object is linked with the products table.

  # A product has a many to one relationship with a category.
  # The products table has a category_id foreign key.
  # In other words, a product belongs to a category.
  # Columns: id, name, description, price, stock_quantity, category_id, created_at, updated_at
  # Association: Belongs to category (category_id)
  belongs_to :category

  validates :name, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :description, :price, :stock_quantity, presence: true
end
