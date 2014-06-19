#This class will receive the key and store it for the duration of the game.

class Sequence
  attr_reader :key_sequence  # => nil

  def initialize(key_sequence)
    @key_sequence = key_sequence
  end
end

if __FILE__== $0

end
