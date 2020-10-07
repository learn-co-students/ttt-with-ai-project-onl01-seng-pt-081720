module Players
    class Human < Player
        def move(board_arg)
            puts "Please enter the position you'd like to move to:"
            user_input = gets.chomp
        end
    end
end