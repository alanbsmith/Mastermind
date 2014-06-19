
class Game

  def initialize
    @guesses = []
  end

  def turns_taken
    @guesses.count
  end

  def guesses
    @guesses
  end

  def <<(sequence)
    @guesses << sequence
  end

  def guess_history
    @guesses.each do |guess| guess end
  end

end
