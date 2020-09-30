module Players
    class Human < Player 
        #asks for user input and returns it
        def move(board)
            puts "Please enter 1-9:"
            gets.chomp
        end
        #takes in a board argument and allows a human player to enter a move via the CLI. The method should return the value the user enters. Even though the method accepts a board argument, it does not need to use it.
    end
end