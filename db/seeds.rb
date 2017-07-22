# Users

User.create!(name: "super_user",
             email: "admin@admin.com",
             password: "admin123",
             password_confirmation: "admin123",
             admin: true)

User.create!(name: "user_example",
             email: "example@example.com",
             password: "example123",
             password_confirmation: "example123",
             admin: false)

100.times do |u|
  password = "123123" 

  User.create!(name: Faker::Name.name,
               email: Faker::Internet.email,
               password: password,
               password_confirmation: password)
end

220.times do |x|
  Item.create!(name: "Coffee cups",
               state: false,
               user_id: nil)
end

463.times do |x|
  Item.create!(name: "White cups",
               state: false,
               user_id: nil)
end

75.times do |x|
  Item.create!(name: "Normal cups",
               state: false,
               user_id: nil)
end

19.times do |x|
  Item.create!(name: "Super Bock cups",
               state: false,
               user_id: nil)
end

10.times do |x|
  Item.create!(name: "Packs of napkins",
               state: false,
               user_id: nil)
end

23.times do |x|
  Item.create!(name: "White bowls",
               state: false,
               user_id: nil)
end

7.times do |x|
  Item.create!(name: "Bowls",
               state: false,
               user_id: nil)
end

4.times do |x|
  Item.create!(name: "Metal bowls",
               state: false,
               user_id: nil)
end

143.times do |x|
  Item.create!(name: "Plates",
               state: false,
               user_id: nil)
end

4.times do |x|
  Item.create!(name: "Pack of garbage bags",
               state: false,
               user_id: nil)
end

400.times do |x|
  Item.create!(name: "Toothpicks",
               state: false,
               user_id: nil)
end

3.times do |x|
  Item.create!(name: "Packs of Food bags",
               state: false,
               user_id: nil)
end

1.times do |x|
  Item.create!(name: "Pack of black tea",
               state: false,
               user_id: nil)
end

412.times do |x|
  Item.create!(name: "Sugar",
               state: false,
               user_id: nil)
end

20.times do |x|
  Item.create!(name: "Delta coffee",
               state: false,
               user_id: nil) 
end

1.times do |x|
  Item.create!(name: "Pack of coffee spoons",
               state: false,
               user_id: nil)
end

1.times do |x|
  Item.create!(name: "Glove boxes",
               state: false,
               user_id: nil)
end

2.times do |x|
  Item.create!(name: "Pitchers",
               state: false,
               user_id: nil)
end

55.times do |x|
  Item.create!(name: "Straws",
               state: false,
               user_id: nil)
end

113.times do |x|
  Item.create!(name: "Plastic spoons",
               state: false,
               user_id: nil)
end

110.times do |x|
  Item.create!(name: "Plastic knifes",
               state: false,
               user_id: nil)
end

20.times do |x|
  Item.create!(name: "Plastic forks",
               state: false,
               user_id: nil)
end

13.times do |x|
  Item.create!(name: "Watter bottles",
               state: false,
               user_id: nil)
end
