class WaitingQueue < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :user_id, presence: true 
  validates :item_id, presence: true 


  def destroy_all
    WaitingQueue.all.each do |w|
      w.destroy
    end
  end

end
