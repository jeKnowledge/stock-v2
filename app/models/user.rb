class User < ApplicationRecord

	validates :name, presence: true, 
		length: {minimum: 5, maximum: 30}

	validates :email, presence: true, 
		length: {maximum: 255},
		uniqueness: true

	validates :password, presence: true,
		length: {minimum: 5}

	has_secure_password

	has_many :itens
end
