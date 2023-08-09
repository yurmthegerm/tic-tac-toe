module Narrative
    def intro()
        "Welcome to Tic-Tac-Toe!"
    end

    def user_name(num)
        symbols = {X: 1, O: 2}
        "Please enter the name of Player #{num} (#{symbols.key(num)}): "
    end

    def game_start(player_one, player_two)
        "Welcome, #{player_one.name} & #{player_two.name}. Let's start the game!"
    end

    def instruction(player)
        "Please choose a number (from 1 to 9) you'd like to place your token at, #{player}."
    end

    def invalid()
        "This spot has already taken! Please try again."
    end

    def draw()
        "It's a draw!"
    end

    def win(player)
        "#{player.name} wins!"
    end

end