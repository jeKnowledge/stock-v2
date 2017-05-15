class WaitingQueue < ApplicationRecord
  belongs_to :user
  belongs_to :item


  def destroy_all
    WaitingQueue.all.each do |w|
      w.destroy
    end
  end

end
