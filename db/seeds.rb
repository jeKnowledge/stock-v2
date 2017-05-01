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
             admin: true)

100.times do |u|
  password = Faker::Internet.password

  User.create!(name: Faker::Name.name,
               email: Faker::Internet.email,
               password: password,
               password_confirmation: password)
end


