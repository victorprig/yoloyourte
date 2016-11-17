# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

climate_list = ["Polar", "Plain", "Desert", "Tropical Forest", "Wild Beach"]
shape_list = ["Igloo", "Yurt", "Berber Tent", "Hexayurt", "Tipi"]
price_range = (1..15).to_a
userid_range = (1..User.last.id).to_a

yurt_urls = [
'http://bit.ly/2eJzET5',
'http://bit.ly/2g0ncy6',
'http://bit.ly/2fIJvW0',
'http://bit.ly/2fzPFdI',
'http://bit.ly/2g0lPiQ',
'http://bit.ly/2fzPGOO',
'http://bit.ly/2f7HhBu',
'http://bit.ly/2g1HS6T',
'http://bit.ly/2f3L3sf',
'http://bit.ly/2fzOSsW',
'http://bit.ly/2fZ7eko',
'http://bit.ly/2f7K2CJ']


(1..50).to_a.each_with_index do |x, index|
     yurt = Yurt.create(
        name: Faker::Pokemon.name,
        description:  Faker::Lorem.sentence(3),
        location: Faker::Address.country,
        daily_rate: price_range.sample,
        shape: shape_list.sample,
        climate: climate_list.sample,
        user_id: userid_range.sample,
      )

     yurt.remote_photo_url = yurt_urls.sample

     yurt.save

     Timeslot.create(
        start_date: Date.civil(2017, 1, 1),
        end_date: Date.civil(2017, 7, 1),
        yurt_id: yurt.id)

     Timeslot.create(
        start_date: rand(Date.civil(2017, 7, 2)..Date.civil(2017, 7, 31)),
        end_date: rand(Date.civil(2017, 8, 2)..Date.civil(2017, 9, 1)),
        yurt_id: yurt.id)
end




