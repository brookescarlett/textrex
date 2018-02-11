# class RestaurantORM
#   attr_accessor :id, :name, :location, :address, :description
#
#   def self.create_from_hash(hash)
#     new_from_hash(hash).insert
#   end
#
#   def self.new_from_hash(hash)
#     restaurant = self.new
#     restaurant.name = hash[:name]
#     restaurant.location = hash[:location]
#     restaurant.address = hash[:address]
#     restaurant.description = hash[:description]
#
#     restaurant
#   end
#
#   def self.create_table
#     sql = <<-SQL
#       CREATE TABLE IF NOT EXISTS restaurants (
#         id INTEGER PRIMARY KEY,
#         name TEXT,
#         location TEXT,
#         address TEXT,
#         description TEXT
#       )
#     SQL
#     DB[:conn].execute(sql)
#   end
#
#   def insert
#     Restaurant.create_table
#     sql = <<-SQL
#       INSERT INTO restaurants (name, location, address, description)
#       VALUES (?, ?, ?, ?)
#     SQL
#
#     DB[:conn].execute(sql, self.name, self.location, self.address, self.description)
#   end
#
#   def self.all
#     sql = <<-SQL
#       SELECT * FROM restaurants
#     SQL
#
#     rows = DB[:conn].execute(sql)
#     rows.collect do |row|
#       self.new_from_db(row)
#     end
#   end
#
#   def self.drop_table
#     sql = <<-SQL
#       DROP TABLE restaurants
#     SQL
#
#     rows = DB[:conn].execute(sql)
#   end
#
#   def self.list_of_locations
#     sql = <<-SQL
#       SELECT *
#       FROM restaurants
#       GROUP BY (location)
#     SQL
#
#     rows = DB[:conn].execute(sql)
#     rows.collect do |row|
#       inst = self.new_from_db(row)
#       inst.location
#     end
#   end
#
#   # def update
#   #   sql = <<-SQL
#   #     UPDATE restaurants
#   #     SET location = ?
#   #     WHERE id = ?
#   #   SQL
#   #   DB[:conn].execute(sql, self.name, self.breed, self.id)
#   # end
#
#   def self.by_location(location)
#     sql = <<-SQL
#       SELECT *
#       FROM restaurants
#       WHERE location = ?
#     SQL
#
#     rows = DB[:conn].execute(sql, location)
#     rows.collect do |row|
#       self.new_from_db(row)
#     end
#   end
#
#   def self.new_from_db(row)
#     new_restaurant = Restaurant.new_from_hash(id: row[0], name: row[1], location: row[2], address: row[3], description: row[4])
#     new_restaurant
#   end
#
#
#
# end
