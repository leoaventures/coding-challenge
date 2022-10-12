class CreateCarriers < ActiveRecord::Migration[6.1]
  def change
    create_table :carriers do |t|
      t.string :name
      t.decimal :shipping_rate
      t.string :currency
      t.timestamps
    end
  end
end
