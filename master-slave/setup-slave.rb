#!/usr/bin/env ruby

node_number = ARGV[0]
port = 30000 + node_number.to_i
data_dir = "set#{node_number}"

`mkdir -p #{data_dir}`
command = "mongod --dbpath #{data_dir} --port #{port} --logpath log/log-server-#{port}.log --rest --slave --source stannis.local:30001"
puts "Executing #{command}"

system(command)
