class CreateRates < ActiveRecord::Migration[6.1]
  def change
    create_table :rates do |t|
      t.decimal :rate
      t.string :currency
      t.string :origin
      t.string :destination
      t.timestamps
    end
    add_reference :rates, :carrier, foreign_key: true
  end
end
