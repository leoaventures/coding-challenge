json.rates @rates.each do |rate|
    json.id rate.id
    json.name rate.carrier.name
    json.rate rate.rate
    json.currency rate.currency
    json.common_rate rate.common_rate
    json.origin rate.origin
    json.destination rate.destination
end