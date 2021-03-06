module WaitingQueueHelper
  def is_user_waiting_for_item?(item)
    waiting_queue = WaitingQueue.all

    waiting_queue.each do |w|
      if w.user_id == current_user.id && w.item_id == item.id
        return true
      end
    end
    false
  end

  def id_given_user_item(item)
    waiting_queue = WaitingQueue.all

    waiting_queue.each do |w|
      if w.user_id == current_user.id && w.item_id == item.id
        return w.id 
      end
    end
  end

  def is_item_available?(item)
    items = Item.all

    items.each do |i|
      if i.name.eql?item.name and !i.state
        return true
      end
    end 
    false
  end

end
