#tests correct number and positions
require_relative '../test/test_helper'

class SequenceMatcherTest < Minitest::Test

  def test_it_recognizes_a_full_match
    key   = ['R','G','B','Y']
    guess = ['R','G','B','Y']
    match = SequenceMatcher.new(key,guess)

    assert_equal true, match.complete_match
  end

  def test_it_returns_the_correct_number_of_positions
    key   = ['R','G','B','Y']
    guess = ['G','R','B','Y']
    match = SequenceMatcher.new(key,guess)

    assert_equal 2, match.correct_positions
  end

  def test_it_doesnt_break_with_different_array_lengths
    key   = ['B','R','R','B','Y']
    guess = ['B','R','B','Y']
    match = SequenceMatcher.new(key,guess)

    assert_equal 2, match.correct_positions
  end

  def test_it_returns_the_correct_content_count
    key   = ['B','R','G','Y']
    guess = ['R','G','B','Y']
    match = SequenceMatcher.new(key,guess)

    assert_equal 4, match.correct_content
  end

  def test_repeats_in_the_guess_dont_fuck_it_up
    key   = ['B','R','B','Y']
    guess = ['B','B','B','Y']
    match = SequenceMatcher.new(key,guess)

    assert_equal 2, match.correct_content
  end

  def test_repeats_in_the_key_dont_fuck_it_up
    key   = ['B','B','B','Y']
    guess = ['R','G','B','Y']
    match = SequenceMatcher.new(key,guess)

    assert_equal 2, match.correct_content
  end

end
