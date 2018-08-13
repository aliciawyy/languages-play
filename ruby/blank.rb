# Open class in Ruby, e.g. you can add a method to String class
class String
  def blank?
    self.size == 0
  end
end

class NilClass
  def blank?
    true
  end
end

["", "person", nil].each do |element|
  puts element unless element.blank?
end
