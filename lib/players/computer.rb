module Players
    class Computer < Player
        def move(board_arg)
            rand(1..9).to_s
        end
    end
end