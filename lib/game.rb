require 'pry'

class Game
    attr_accessor :board, :player_1, :player_2, :current_player

    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
    ]

    def initialize(player_1_arg = Players::Human.new("X"), player_2_arg = Players::Human.new("O"), board_arg = Board.new)
        @player_1 = player_1_arg
        @player_2 = player_2_arg
        @board = board_arg
    end

    def current_player
        if @board.turn_count % 2 == 0
            @player_1
        else
            @player_2
        end
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
          start_index = 0
          if @board.cells[combo[start_index]] == "X" && @board.cells[combo[start_index + 1]] == "X" && @board.cells[combo[start_index+2]] == "X"
              return combo
          elsif @board.cells[combo[start_index]] == "O" && @board.cells[combo[start_index + 1]] == "O" && @board.cells[combo[start_index + 2]] == "O"
              return combo
          end
          false
        end
    end

    def full?
        if @board.cells.include?(" ")
            false
        else
            true
        end
    end


    def draw?
        if won? == nil && full? == true
            true
        else
            false
        end
    end

    def over?
        if won? != nil || full? == true || draw? == true
            true
        else
            false
        end
    end

    def winner
        winner_string = nil
        if won? != nil
            winner_string = @board.cells[won?[0]]
        end
        winner_string
    end

    def turn
        puts "Please enter a number 0-9 where you'd like to move:"
        @move_result = current_player.move(@board)
        number_from_result = @move_result.to_i
        if @board.valid_move?(@move_result)
            @board.update(number_from_result, current_player)
        else
            puts "Please enter another number."
            @move_result = current_player.move(@board)
        end
    end

    def play

        while over? == false
            turn
        end

        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

end