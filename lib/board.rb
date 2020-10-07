class Board
    attr_accessor :cells

    def initialize
        @cells = Array.new(9, " ")
    end

    def reset! 
        cells.clear
        @cells = Array.new(9, " ")
    end

    def display
        counter_index = 0
        row_counter = 0
        while row_counter < 3
            puts " #{@cells[counter_index]} | #{@cells[counter_index+1]} | #{@cells[counter_index+2]} "
            if row_counter < 2
                puts "-----------"
            end
            row_counter += 1
            counter_index += 3
        end
    end

    def position(posit_arg)
        @cells[posit_arg.to_i - 1]
    end

    def full?
        if @cells.include?(" ")
            false
        else
            true
        end
    end

    def turn_count
        final_count = 0
        @cells.each do |item|
            if item != " "
                final_count += 1
            end
        end
        final_count
    end

    def taken?(taken_arg)
        if position(taken_arg) == "X" || position(taken_arg) == "O"
            true
        else
            false
        end
    end

    def valid_move?(posit_arg)
        user_num = Integer(posit_arg) rescue false 
        if user_num 
            if taken?(posit_arg) == true
                false
            else
                true
            end
        end
    end

    def update(posit_arg, player_arg)
        if valid_move?(posit_arg) == true && full? == false && taken?(posit_arg) == false
            array_position = posit_arg.to_i - 1
            @cells[array_position] = player_arg.token
        end
    end
end