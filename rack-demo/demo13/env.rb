ENV["RACK_ENV"] ||= "development"

require "dotenv"
Dotenv.load(".env.#{ENV['RACK_ENV']}")
