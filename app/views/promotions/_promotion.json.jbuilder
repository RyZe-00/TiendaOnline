json.extract! promotion, :id, :name, :discount_percentage, :start_date, :end_date, :created_at, :updated_at
json.url promotion_url(promotion, format: :json)
