class Game
    attr_accessor :board, :player_1, :player_2
    
    WIN_COMBINATIONS = [
        [0,1,2], #top row
        [3,4,5], #middle row
        [6,7,8], #bottom row
        [0,3,6], #left-most column
        [1,4,7], #middle column
        [2,5,8], #right-most column
        [0,4,8], #L(top) to R(bottom) diagonal  
        [6,4,2] #L(bottom) to R(top) diagonal
    ]

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    #returns the correct player, X, for the 3rd move
    def current_player
        board.turn_count.even? ? player_1 : player_2
    end

    def won?
        WIN_COMBINATIONS.find do |i| #i = first array in constant. EX: @cells[0] = [0, 1, 2]
            #what we want = 1st item in the 1st array
            #if the position is taken at the given index, and the 3 possible indexes to create the winning combo are all the same
            board.cells[i[0]] != " " && board.cells[i[0]] == board.cells[i[1]] && board.cells[i[1]] == board.cells[i[2]]
        end
    end

    def draw?
        board.full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        board.cells[won?[0]] if won?
    end

    #makes valid moves
    #asks for input again after a failed validation
    #changes to player 2 after the first turn
    def turn
        input = current_player.move(board).to_i
        if board.valid_move?(input.to_s)
            board.update(input, current_player)
            board.display
        elsif input.between?(1, 9) == false
            puts "That is an invalid move"
            turn
        else
            puts "Whoops! Looks like that position is taken"
            turn
        end
    end

    #asks for players input on a turn of the game
    def play
        until over?
            turn
        end
        if draw?
            puts "Cat's Game!"
        elsif won?
            puts "Congratulations #{winner}!"
        end
    end
end