class MonetizeRateAndCarrier < ActiveRecord::Migration[6.1]
  def change
    add_monetize :rates, :price
    add_monetize :carriers, :price 
  end
end
