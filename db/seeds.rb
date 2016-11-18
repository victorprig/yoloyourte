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
'http://bit.ly/2f7K2CJ',
'http://www.customtravelplanner.net/wordpress/wp-content/uploads/2015/02/Second-Mongolia-Yurt-D12046907.jpg',
'https://media.gadventures.com/media-server/cache/36/91/369167eb47d69c49902e4fc6016c7852.jpg',
'https://s-media-cache-ak0.pinimg.com/originals/33/22/fa/3322fa4124565022f0fef35edd63e151.jpg',
'http://www.motherearthnews.com/~/media/Images/MEN/Editorial/Articles/Magazine%20Articles/1971/03-01/Building%20a%20Yurt/yurt.jpg',
'https://www.portugalnaturelodge.com/wp-content/uploads/2015/12/DSC_0090.jpg',
'https://aos.iacpublishinglabs.com/question/aq/1400px-788px/indians-used-teepees_a0ea263b139ed538.jpg?domain=cx.aos.ask.com',
'https://s-media-cache-ak0.pinimg.com/originals/a2/9a/a8/a29aa855012c8189d044f1895a1830e6.jpg',
'http://assets.inhabitat.com/wp-content/blogs.dir/1/files/2016/08/Getaway-Cabin-Design.jpg',
'http://wallpapersonthe.net/wallpapers/b/3840x2160/3840x2160-igloo_man_made-14552.jpg',
'https://s-media-cache-ak0.pinimg.com/originals/20/fa/65/20fa65539d033bd9daf15bb9a1464b90.jpg',
'https://pacapride.files.wordpress.com/2010/10/03-08-09-snow-in-march-002.jpg',
'http://static.panoramio.com/photos/large/34363163.jpg',
'http://starpig.com/africapics/security_hut1.JPG',
'https://everyoneneedswater.files.wordpress.com/2013/04/turkana-hut.jpg',
'http://3.bp.blogspot.com/-bxG66dYzA90/U39OHFzvjhI/AAAAAAAAAHI/GLYv7X1_zJs/s1600/Beehive+Hut.jpeg']



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




