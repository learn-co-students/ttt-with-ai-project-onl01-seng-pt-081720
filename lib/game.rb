require 'pry'
class Game
    attr_accessor :board, :player_1, :player_2, :input
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]
    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        if board.turn_count.even?
            return player_1
        else
            return player_2
        end
    end

    def won?
        WIN_COMBINATIONS.each do |c|
            if @board.cells[c[0]] == @board.cells[c[1]] && @board.cells[c[1]] == @board.cells[c[2]] && @board.taken?(c[0]+1)
              return c
            end
          end
        return false
    end

    def draw?
        @board.full? && !won? 
    end

    def over?
        if won? || draw?
            return true
        else
            return false
        end
    end

    def winner
        if won?
          c = won?
          @board.cells[c[0]]
        end
    end

    def turn
        puts "Please enter 1-9:"
        @input = current_player.move(@board)
        
        until @board.valid_move?(@input)
            puts "Please enter 1-9:"
            @input = current_player.move(@board)
        end
        @board.update(@input, current_player)
        
    end

    def play
        
        
        until over?
            turn
        end
        
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            #binding.pry
            puts "Cat's Game!"
        end
    end
    
end
