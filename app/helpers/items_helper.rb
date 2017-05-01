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
end
