require_relative '../test/test_helper'
require 'pry'
require 'colorize'

class CLI

  attr_reader :command,
              :turns,
              :game

  def initialize(game)
    @command = ''
    @turns = game.turns_taken
    @starting_time = Time.now
    @printer = Printer.new
  end


  def self.run
    game = Game.new
    @starting_time
    Printer.new.welcome
    new(game).start

  end

#Gets the game up and running
  def start
      puts "\n"
      print "Would you like to (p)lay,(r)ead the instructions, or (q)uit?  ".bold
      parts = process_input(gets.strip)
      assigns_instructions(parts)
      execute_command
  end

#Makes sense of the input
   def process_input(input)
    input.split
  end

  def assigns_instructions(parts)
    @command = parts[0]
  end

#Executes commands
  def execute_command
    while command != 'q'
      case command
      when "play", "p"
        play
      when "read", "r"
        @printer.instructions
        start
      else
        puts "Invalid Command. Please try again.".red.bold
        start
      end
    end
  end

  def play
    sg = SequenceGenerator.new
    @sequence = sg.generate
    puts @printer.explanation
    @guess = ''
    while @guess != "Q"
      guess_input = gets.chomp.upcase
       if guess_input == "Q"
         abort("Goodbye!".bold)
       elsif guess_input == "BACKDOOR"
         backdoor
       elsif !Guess.valid?(guess_input) then
         puts "'#{guess_input}' is not a valid entry. Please try again.".red.bold
         next
       end
      @guess = Guess.new(guess_input.chars)
      @turns += 1
      match_sequence
    end
  end

  def match_sequence
    match = SequenceMatcher.new(@sequence, @guess)
    if match.complete_match
      total_time = (Time.now - @starting_time).to_i
      puts "\n"
      puts "Congratulations! You guessed the sequence '#{@sequence.key_sequence.join}' in #{@turns} turns in #{total_time} seconds!".green.bold
      puts "Thanks for playing!".green.bold
      puts "\n"
      repeat
    else
      positions = match.correct_positions
      content = match.correct_content
      puts "\n"
      puts "'#{@guess.sequence.join}' includes #{content} of the correct colors with #{positions} in the correct positions".bold
    end
  end

  def repeat
    @turns = 0
    puts "Do you want to (p)lay again or (q)uit?".bold
    input = (gets.chomp.upcase)
    if input == 'P'
      play
    elsif input == 'Q'
      abort("Thanks for playing!")
    else
      start
    end
  end

  def backdoor
    key = @sequence.key_sequence.join
    puts "This is the key sequence: #{key}".green.bold
  end
end


if __FILE__== $0
CLI.run
end
