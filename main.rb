require_relative "player.rb"
require_relative "board.rb"
require_relative "narrative.rb"
require_relative "game.rb"

PLAYER_ONE = "X"
PLAYER_TWO = "O"

def play_game
    game = Game.new()
    game.play
    repeat_game
end

def repeat_game
    puts "Would you like to try again? (y/n)"
    input = gets.chomp.downcase
    if input == 'y'
        play_game
    else
        puts "Good bye."
    end
end

play_game