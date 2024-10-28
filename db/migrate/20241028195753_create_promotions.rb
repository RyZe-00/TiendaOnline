class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.text :name
      t.decimal :discount_percentage
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
