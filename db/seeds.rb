# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

con = ActiveRecord::Base.connection
con.execute("INSERT INTO recipes (id, title, making_time, serves, ingredients, cost, created_at, updated_at) VALUES (1, 'チキンカレー', '45分', '4人', '玉ねぎ,肉,スパイス', 1000, '2016-01-10 12:10:12', '2016-01-10 12:10:12');")
con.execute("INSERT INTO recipes (id, title, making_time, serves, ingredients, cost, created_at, updated_at) VALUES (2, 'オムライス', '30分', '2人', '玉ねぎ,卵,スパイス,醤油', 700, '2016-01-11 13:10:12', '2016-01-11 13:10:12');")
