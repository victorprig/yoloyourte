# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

climate_list = ["banquise", "plaine", "désert aride", "forêt vierge", "plage sauvage"]
shape_list = ["igloo", "yurt", "tente berbere", "hexayurt", "tipi"]
price_range = (1..15).to_a
userid_range = (1..User.last.id).to_a

(1..50).to_a.each_with_index do |x, index|
     Yurt.create(
        name: Faker::Pokemon.name,
        description:  Faker::Lorem.sentence(3),
        location: Faker::Address.country,
        daily_rate: price_range.sample,
        shape: shape_list.sample,
        climate: climate_list.sample,
        user_id: userid_range.sample,
      )
end


