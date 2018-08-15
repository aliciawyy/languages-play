class ActAsCsv
  def initialize
    @result = []
    read
  end

  def read
    file = File.new(self.class.to_s.downcase + '.txt')
    @headers = file.gets.chomp.split(', ')

    file.each do |row|
      @result << row.chomp.split(', ')
    end
  end
end

class RubyCsc < ActAsCsv
end
