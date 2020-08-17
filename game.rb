require_relative './player'
require_relative './question'

class Game 

  # Constructor
  def initialize

    # Creating the players
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @players = [@player1, @player2]

    # No. of rounds
    @round = 1
  end

  # No. of Rounds
  def next_round
    puts
    puts "---------------------"
    puts " Round ##{@round}"
    puts "--------------------"
    puts
    # next round
    @round += 1
    @players.rotate
  end

  # Game Status
  def display_game_status

    puts
    puts "-------------"
    puts " Status "
    puts "-------------"
    puts
    @players.each {|player| puts "#{player.name} HP: #{player.dead? ? "Dead": player.hp}"}
    puts 

  end

  # Get an array of remaining players
  def remaining_player
    @players.select {|player| !player.dead?}

  end

  # Get the winner
  def get_winner
    puts "The winner is #{remaining_player.first.name} with a score of #{remaining_player.first.hp}/3"
  end 
  
  # Check if it's game over (Lost all three lives)
  def game_over
    remaining_player.count == 1
  end

  
  # Method to check answer
  def answer_check(input)
    if (input == true)
      puts "YES! You are correct."
    else 
      puts "Seriously? Wrong!"
    end
  end
  
  # Play method - Main game loop
  def play

    until game_over do
      
      next_round
      
      
      # Establishing player
      current_player = @players[0]

  
      # Player one  is prompted the question and must answer correctly or lose a life.
      new_question = Question.new
      puts "#{current_player.name} What does #{new_question.num_1} + #{new_question.num_2} equal?"
      answer = $stdin.gets.chomp.to_i
      puts
      if answer == new_question.answer
        puts "YES! You are correct."
      else 
        puts "Seriously? Wrong!"
        current_player.life_loss
      end
      
  
      # Display Status
      display_game_status
      
      # Tell Ruby Program to Wait some amount of time
      sleep 2

    end
    # Check who won
    get_winner


  end

end