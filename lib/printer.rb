require_relative '../test/test_helper'
require 'pry'
require 'colorize'

class Printer

  def initialize
  end

  def explanation
    puts "\n"
    puts " I have generated a beginner sequence with four elements made up of:"
    puts "(r)ed,(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
    puts  "What's your guess?".bold
    puts "\n"
  end

  def instructions
    puts "\n"
    puts "I will be the codemaker, you will be the codebreaker."
    puts "Duplicates are allowed, so the player could even choose four codes of the same color."
    puts "The chosen pattern is entered into the command line."
    puts "The codemaker chooses a pattern of four color."
    puts "Duplicates are allowed, so the player could even choose four codes of the same color."
    puts "The chosen pattern is entered into the command line."
    puts "You must guess the pattern, in both order and color. Once played, I will provides feedback for both color and position.'"
    puts"\n"
  end

  def welcome

    puts "\n"
    print"
                                              _---~~(~~-_.
                                            _{        )   )
                                          ,   ) -~~- ( ,-' )_
                                         (  `-,_..`., )-- '_,)
                                        ( ` _)  (  -~( -_ `,  }
             WELCOME TO                 (_-  _  ~_-~~~~`,  ,' )
                                         `~ -^(    __;-,((()))
            MASTERMIND!!                       ~~~~ {_ -_(())
                                                        `{  }
                                                         { }
                                                                ".green.bold
  end
end
