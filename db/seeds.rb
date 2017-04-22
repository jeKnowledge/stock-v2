# Users

100.times do |u|
	password = Faker::Internet.password

	User.create!(name: Faker::Name.name,
				 email: Faker::Internet.email,
				 password: password,
				 password_confirmation: password)
end

150.times do |i|
	Item.create!(name: Faker::Lorem.characters(5),
				 state: true)

end

