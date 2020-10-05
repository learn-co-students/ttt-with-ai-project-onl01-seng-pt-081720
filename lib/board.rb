require 'pry'

class Board
    
    attr_accessor :cells
    
    def initialize
        self.reset!
    end
    
    def cells
        @cells 
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(input)
        input = input.to_i
        return @cells[input - 1]
    end

    def full?
        full_or_not = true
        @cells.find do |c|
            if c == " "
                full_or_not = false
            end
        end
        full_or_not
    end

    def turn_count
        count = 0
        @cells.each do |c|
            if c == "X" || c == "O"
                count += 1
            end
        end
        count
    end

    def taken?(input)
        pos = input.to_i
        if @cells[pos - 1] == "X" || @cells[pos - 1] == "O"
            return true
        else
            return false
        end
    end

    def valid_move?(input)
        if input.to_i >= 1 && input.to_i <= 9 && @cells[input.to_i - 1] == " "
            return true
        else
            return false
        end
    end

    def update(input, player)
        index = input.to_i - 1
        @cells[index] = player.token
    end
end