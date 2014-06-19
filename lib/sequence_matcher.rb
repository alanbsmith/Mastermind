#This class will receive the guess and key sequence objects from Game
                  #and evaluate if they match
#strings will have to be converted with .chars before
#they will be ready to be evaluated by the matcher
require_relative '../test/test_helper'


class SequenceMatcher

  def initialize(key,guess)
    @key = key
    @guess = guess
  end

  def complete_match
    @key.key_sequence == @guess.sequence
  end

  def correct_positions
    @key.key_sequence.zip(@guess.sequence)
                     .select { |a,b| a == b}
                     .size
  end

  def correct_content
    (@key.key_sequence & @guess.sequence).size
  end

end

# http://rdoc.info/stdlib/core/Enumerable#zip-instance_method
# zip
# all?
# select {...}.size
#
# double check that it works if s1.length < s2.length and vice versa
