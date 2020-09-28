class Board

  attr_accessor :cells

  def initialize
    self.new_board
  end

  def reset!
    self.new_board
  end

  def new_board
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(position)
    position = @cells[position.to_i - 1]
  end

  def full?
    @cells.none?(" ")
  end

  def turn_count
    counter = 0
    @cells.map do |c|
      if c == "X" || c == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(input)
    !position(input).include?(" ")
  end

  def valid_move?(input)
    (1..9).include?(input.to_i) && !self.taken?(input)
  end

  def update(input, player)
    @cells[input.to_i - 1] = player.token
  end

end
