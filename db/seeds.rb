# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

# add carriers
carrier_text = File.read('carrier_data.csv')
carrier_csv = CSV.parse(carrier_text, :headers => true, :encoding => 'ISO-8859-1')
carrier_csv.each do |carrier|
    if Carrier.where(id: carrier['id']).exists?
        puts "#{carrier['name']} already exists"
    else
        c = Carrier.new
        c.id = carrier['id']
        c.name = carrier['name']
        c.shipping_rate = carrier['flat shipping rate']
        c.currency = carrier['currency']
        c.save
        puts "#{c.name} saved"
    end
end

# add rates
rate_text = File.read('rate_data.csv')
rate_csv = CSV.parse(rate_text, :headers => true, :encoding => 'ISO-8859-1')
rate_csv.each do |rate|
    existing_rate = Rate.where(carrier_id: rate['carrier id'],
        currency: rate['currency'],
        origin: rate['origin'],
        destination: rate['destination']).exists?

    if existing_rate
        puts "#{rate['carrier id']} #{rate['currency']} #{rate['origin']} #{rate['destination']} already exists"
    else
        r = Rate.new
        r.rate = rate['rate']
        r.currency = rate['currency']
        r.origin = rate['origin']
        r.destination = rate['destination']
        r.carrier_id = rate['carrier id']
        r.save
        puts "#{r.carrier_id} #{r.currency} #{r.origin} #{r.destination} saved"
    end
end

