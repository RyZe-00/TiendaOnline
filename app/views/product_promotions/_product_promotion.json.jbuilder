json.extract! product_promotion, :id, :product_id, :promotion_id, :created_at, :updated_at
json.url product_promotion_url(product_promotion, format: :json)
