class Product < ApplicationRecord
  has_many :order_items
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :product_promotions
  has_many :promotions, through: :product_promotions
  has_many :reviews
end
