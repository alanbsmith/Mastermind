require_relative '../test/test_helper'

class CLITest < Minitest::Test
  attr_reader :cli

  def setup
    game = Game.new
    @cli ||= CLI.new(game)
  end

  def test_it_exists
    assert cli
  end
end
