module Players
    class Computer < Player
        def move(board)
            if board.cells[4] == " "
            "1"
            elsif board.cells[0] == " "
            "2"
            elsif board.cells[2] == " "
            "3"
            elsif board.cells[6] == " "
            "4"
            elsif board.cells[8] == " "
            "5"
            elsif board.cells[1] == " "
            "6"
            elsif board.cells[3] == " "
            "7"
            elsif board.cells[5] == " "
            "8"
            elsif board.cells[7] == " "
            "9"
        end
      end
    end
  end