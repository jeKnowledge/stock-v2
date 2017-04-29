class Item < ApplicationRecord
  belongs_to :user, optional: true

  default_scope -> {order(:name)}
  validates :name, presence: true,
    length: {minimum: 5, maximum: 255} 

  validates :state, presence: true, allow_blank: true
end
