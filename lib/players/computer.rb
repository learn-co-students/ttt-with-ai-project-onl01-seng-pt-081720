module Players

    class Computer < Player 

        def move(board)
            case
                when board.cells[4] == " "
                    "5"
                when board.cells[2] == " "
                    "3"
                when board.cells[0] == " "
                    "1"
                when board.cells[8] == " "
                    "9"
                when board.cells[6] == " "
                    "7"
                when board.cells[1] == " "
                    "2"
                when board.cells[5] == " "
                    "6"
                when board.cells[7] == " "
                    "8"
                when board.cells[3] == " "
                    "4"
            end         
        end
    end
end

# WIN_COMBINATIONS = [
#         [0,1,2], #top row
#         [3,4,5], #middle row
#         [6,7,8], #bottom row
#         [0,3,6], #left-most column
#         [1,4,7], #middle column
#         [2,5,8], #right-most column
#         [0,4,8], #L(top) to R(bottom) diagonal  
#         [6,4,2] #L(bottom) to R(top) diagonal
#     ]