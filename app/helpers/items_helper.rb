module ItemsHelper

  def hash_has_name?(hash, item)
    flag = false 
    hash.keys.each do |i|
      if i.name.eql?item.name
        flag = true 
      end
    end
    flag
  end


  def hash_has_name_not_available?(hash, item)
    flag = false 
    hash.keys.each do |i|
      if (i.name.eql?item.name) && (i.user_id == item.user_id)
        flag = true 
      end
    end
    flag
  end
end
