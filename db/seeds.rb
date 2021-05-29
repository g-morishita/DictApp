# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

item = Item.create!(name: "TPO54_L1")
item.source.attach(io: File.open(Rails.root.join('app/assets/audio/TPO54_L1/L1.mp3')), filename: 'L1.mp3')

30.times do |i| 
  text = Text.create!(item_id: item.id, body: "test", order: i+1)
  text.sound.attach(io: File.open(Rails.root.join("app/assets/audio/TPO54_L1/#{i+1}_L1.mp3")), filename: "#{i+1}_L1.mp3")
end
