require "csv"
require "mongo"

mongodb_connection = Mongo::Connection.new('stannis.local', 30002, :safe => true)

database = mongodb_connection.db("IP2Country")
collection = database["ips"]

entries = CSV.read("GeoIPCountryWhois.csv")
entries.each_with_index do |entry, index|
  collection.insert({
    from_ip: entry[0],
    to_ip: entry[1],
    from_integer: entry[2],
    to_integer: entry[3],
    country_acronym: entry[4],
    country_name: entry[5] 
  })
  puts "Inserted #{index +1} elements"
  
  if index % 1000 == 0
    puts "sleeping"
    sleep 1    
  end
end