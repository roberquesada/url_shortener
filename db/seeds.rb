# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


(1..50).each do |link|
  short_url_random = Link.generate_short_link
  Link.create(
    original_url: 'http://www.google.com',
    short_url: short_url_random,
    visited: rand(1..50),
  )
end