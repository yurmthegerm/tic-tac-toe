class Board
    attr_accessor :positions

    WINS = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
    
    def initialize()
        self.positions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def display()
        puts "
        
              #{positions[0]} | #{positions[1]} | #{positions[2]}
              --+---+--
              #{positions[3]} | #{positions[4]} | #{positions[5]}
              --+---+--
              #{positions[6]} | #{positions[7]} | #{positions[8]}        
        
        "
    end

    def place(position, symbol)
        positions[position] = symbol
    end
   
    def full?()
        positions.all? { |elem| elem == PLAYER_ONE || elem == PLAYER_TWO }
    end

    def taken?(position)
        positions[position-1] == PLAYER_ONE || positions[position-1] == PLAYER_TWO
    end

    def win?()
        WINS.any? do |win|
            positions[win[0]-1] == positions[win[1]-1] && positions[win[1]-1] == positions[win[2]-1]
        end
    end
end