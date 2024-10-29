class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validate :quantity_must_not_exceed_stock

  private

  def quantity_must_not_exceed_stock
    if quantity.present? && quantity > product.stock
      errors.add(:Cantidad, "no puede ser mayor que el stock disponible (#{product.stock})")
    end
  end

end
