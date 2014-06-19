require_relative '../test/test_helper'

class SequenceGeneratorTest < Minitest::Test

  def test_it_is_a_four_letter_sequence
    sequence = Sequence.new(4,['R','G','B','Y'])
    assert_equal 4, sequence.generate.length
  end

  #Some might fail due to random generator. That's fine.
  def test_it_uses_letters_from_a_pool
    sequence = Sequence.new(4,['R','G','B','Y'])
    assert_equal true, sequence.generate.include?('R')
    assert_equal true, sequence.generate.include?('G')
    assert_equal true, sequence.generate.include?('B')
    assert_equal true, sequence.generate.include?('Y')
  end

  def test_the_key_is_in_an_array
    sequence = Sequence.new(4,['R','G','B','Y'])
    assert_equal 
  end
end
