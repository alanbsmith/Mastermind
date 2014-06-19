#This class will generate the key sequence
                #contain a sequence with a specified length
                #uses specific letters for the sequence
require_relative '../test/test_helper'

class SequenceGenerator

  def initialize(length=4, pool=['R','G','B','Y'])
    @length = length
    @pool = pool
  end

  def generate
    @key = (0...@length).map { @pool.sample}
    Sequence.new(@key)
  end


  end

if __FILE__== $0
  key = SequenceGenerator.new
  key.to_a
end

# 10.times do
#   sequence = SequenceGenerator.new(4, ['R','G','B','Y'])
#   puts sequence.generate
# end
#   def generate
#     (0...4).map { ('RGBY')[rand(4)] }.join
#   end
# end

# >> #<Sequence:0x000001010a2470>
