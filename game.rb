require_relative "narrative.rb"

class Game
    include Narrative

    attr_accessor :first_player, :second_player, :current_player, :board

    def initialize()
        self.board = Board.new()
        self.first_player = nil
        self.second_player = nil
        self.current_player = nil
    end

    def play
        prep
        board.display
        player_turns
        ending
    end

    def create_player(num)
        puts user_name(num)
        name = gets.chomp
        if num == 1
            Player.new(name, "O")
        else
            Player.new(name, "X")
        end
    end


    def turn(player)
        position = turn_input(player)
        board.place(position-1, player.symbol)
        board.display
    end

    private

    def prep()
        puts intro()
        @first_player = create_player(1)
        @second_player = create_player(2)
    end
    
    def player_turns()
        @current_player = @first_player
        until board.full?
            turn(@current_player)
            break if board.win?
            @current_player = switch_current_player
        end
    end

    def turn_input(player)
        puts instruction(player.name)
        number = gets.chomp.to_i
        return number if not board.taken?(number)

        puts invalid()
        turn_input(player)
    end

    def switch_current_player
        current_player == first_player ? current_player = second_player : current_player = first_player
    end

    def ending
        if board.win?
            puts win(@current_player)
        elsif board.full?
            puts draw()
        end
    end



end