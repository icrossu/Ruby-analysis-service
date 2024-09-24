require 'socket'
require 'optparse'

options = {}
optparse = OptionParser.new do |opts|
  opts.banner = <<-BANNER
  Usage: ruby portscanner.rb [options]

Version 1.0
By: icrossu
Github: github.com/icrossu

This script is a tool for pentesting, specifically for data analysis of a service.

Available Options:

-h, --help                         Show this help menu
-tTARGET, --target=TARGET          Specify the target URL or IP
-sSERVICE, --service=SERVICE       Comma-separated list of ports to scan

About the choice of service, we have these options:

http = 80      ftp = 20   smtp = 25   dns = 53  mysql = 3306
https = 443    ssh = 22    imap = 143  postgresql = 5432   redis = 6379

If you did not find the option here, you can find more on this site:
https://iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml
BANNER

  opts.on("-tTARGET", "--target=TARGET", "Specify the target URL or IP") do |target|
    options[:target] = target
  end

  opts.on("-sSERVICE", "--service=SERVICE", "Comma-separated list of ports to scan") do |service|
    options[:service] = service.split(',').map(&:strip)  
  end
end

optparse.parse!

if options[:target]
  puts "Target: #{options[:target]}"
else
  puts "No target specified"
  exit
end

if options[:service]
  puts "Service: #{options[:service].join(', ')}"
else
  puts "No service specified, using default ports"
  options[:service] = [80, 443, 20, 21, 22, 25, 143, 53, 5432, 3306, 6379].map(&:to_s)
end

def input_data
  print("Input target URL or IP: ")
  target = gets.chomp
  print("Input target service (if you have a question about service -h): ")
  service = gets.chomp
  return target, service
end

def socket_analysis(target, service)
  begin
    remote_info = Socket.getaddrinfo(target, service)

    remote_info.each do |addr|
      puts "Family: #{addr[0]}, Type: #{addr[1]}, Protocol: #{addr[2]}, Address: #{addr[3]}"
    end
  rescue SocketError => e
    puts "Error: #{e.message}"  
  end
end

target = options[:target]
options[:service].each do |service|
  socket_analysis(target, service)
end
