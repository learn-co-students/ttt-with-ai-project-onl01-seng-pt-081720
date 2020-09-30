class Board
    attr_accessor :cells

    def initialize(cells = nil)
        @cells = cells || Array.new(9, " ")
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

    #takes in user input & returns value of board cell
    def position(input) #input = string
        @cells[input.to_i - 1] #converts string input to integer & subtracts 1
    end

    def full?
       #asking are all cells either "X" or "O"?
        @cells.all? {|i| i == "X" || i == "O"} 
    end

    #returns amount of turns based on cell value
    def turn_count
        @cells.count{|cell| cell == "X" || cell == "O"}
    end

    #returns true if the position is X or O
    def taken?(n)
        #used position method from above 
        position(n) == "X" || position(n) == "O"
    end

    #returns true for user input between 1-9 that is not taken
    def valid_move?(n) #n = user input: 1-9 NOT array index numbers: 0-8
        n.to_i.between?(1, 9) && !taken?(n.to_i)
    end

    #updates the cells in the board w/ player token (X or O) according to the input
    def update(input, player)
        input = input.to_i
        cells[input - 1] = player.token
    end
end