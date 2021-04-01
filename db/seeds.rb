# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


d1= DateTime.new(2021,01,01)
d2= DateTime.new(2021,02,14)
d3= DateTime.new(2021,03,17)
d4=DateTime.new(2021,04,18)
[ {name: 'NYRR Happy New Year 2021', date: d1, miles: '5', status: false},
    {name: 'NYRR San Valentine 2021', date: d2, miles: '8', status: false},
    {name: 'NYRR San Patrick 2021', date: d3, miles: '8', status: false},
    {name: 'NYRR Celebrate Our Parks 4M 2021', date: d4, miles: '4', status: true}

].each do |attributes|
    Race.find_or_create_by(attributes)
end    