class Item < ApplicationRecord
  belongs_to :user, optional: true

  validates :name, presence: true,
    length: {minimum: 5, maximum: 255} 

  validates :state, presence: true 
end
