#!/usr/bin/env ruby

node_number = ARGV[0]
port = 30000 + node_number.to_i
data_dir = "set#{node_number}"

puts "Initiating MongoDB server on #{port} using data on #{data_dir}"

`mkdir -p #{data_dir}`

`mongod --dbpath #{data_dir} --port #{port} --logpath log/log-server-#{port}.log --replSet set --rest`