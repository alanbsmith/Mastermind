require_relative '../test/test_helper'

class GameTest < Minitest::Test

  def test_when_the_game_begins_the_number_of_turns_is_zero
    game        = Game.new
    turns_taken = 0
    assert_equal  0, game.turns_taken
  end

  def test_when_the_game_begins_the_number_of_guesses_is_an_empty_array
    game     = Game.new
    guesses  =   []
    assert_equal [], game.guesses
  end

  def test_a_player_is_able_to_make_a_guess
    game       = Game.new
    guess      = Guess.new("RGBY")
    assert_equal "RGBY", guess.sequence
  end

  def test_guesses_are_always_upcase
    game       = Game.new
    guess      = Guess.new("rgby")
    assert_equal "RGBY", guess.sequence
  end

  def test_a_guess_is_added_to_the_guesses_array
    game   = Game.new
    guess  = Guess.new("RGBY")
    game  << guess
    assert_equal "RGBY", guess.sequence
  end

  def test_when_player_guesses_turn_increases_by_one
    game    = Game.new
    game   << Guess.new("RGBY")
    assert_equal 1, game.turns_taken
  end

  def test_there_is_a_guess_history
    game = Game.new
    game << Guess.new("RGBY")
    game << Guess.new("GBYR")
    game << Guess.new("BYGR")
    assert_equal game.guesses, game.guess_history
  end

# Do I want the game or the CLI to generate the key?
  # def test_generate_new_key_at_game_initialization
  #   game = Game.new
  #   key  = SequenceGenerator.new
  #
  #   assert key
  # end
end
