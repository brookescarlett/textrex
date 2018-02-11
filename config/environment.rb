require 'bundler'
Bundler.require
require 'open-uri'
require 'sinatra/activerecord'
require 'nokogiri'
require 'colorize'
require 'lolize/auto'

# DB = {
#   conn: SQLite3::Database.new('db/restaurant.db'),
# }
#connection_details = YAML::load(File.open('config/database.yml'))
old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

#require_all 'lib'
