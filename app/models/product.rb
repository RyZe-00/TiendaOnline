class Product < ApplicationRecord
  has_many :order_items

  has_many :product_promotions
  has_many :promotions, through: :product_promotions
  has_many :reviews
  has_many :cart_items

  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  def category_ids=(ids)
    self.product_categories = ids.map { |id| ProductCategory.new(category_id: id) if id.present? }.compact
  end
end
