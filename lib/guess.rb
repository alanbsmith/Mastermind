#This class will initialize guess sequences
                #upcase for consistency

class Guess

  def initialize(sequence)
    @sequence = sequence
  end

  def sequence
    @sequence
  end

  def self.valid?(guess)
    guess.to_s.upcase =~ /^[RGBY]{4}$/
  end

end
