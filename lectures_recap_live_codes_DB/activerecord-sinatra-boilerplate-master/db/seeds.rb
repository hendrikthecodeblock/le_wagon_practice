require 'faker'

CAT = ["Gourmet", "Fast Food", "Vegetarian", "Suhsi", "Italian"]

15.times do
  Restaurant.create!(
    name: Faker::Coffee.blend_name,
    city: Faker::Address.city,
    category: CAT.sample
  )
end
