# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# post_list = [
#   [ "Title 1", "Body 1" ],
#   [ "Title 2", "Body 2" ],
#   [ "Title 3", "Body 3" ],
#   [ "Title 4", "Body 4" ]
# ]

# post_list.each do |title, body|
#   Post.create( title: title, body: body )
# end

puts "Seeding Post Data - "

Post.create([{title: "title1", body: "body1"},{title: "title2", body: "body2"}, {title: "title3", body: "body3"}])



