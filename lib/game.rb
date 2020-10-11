class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS  = [
    [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    if self.board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def won?
    result = false
    WIN_COMBINATIONS.map do |combo|
      check_array = []
      combo.map do |int|
        check_array << @board.cells[int]
      end
      if check_array[0] == check_array[1] && check_array[1] == check_array[2] && check_array[0] != " "
        result = combo
      end
    end
    result
  end

  def over?
    @board.full?
  end

  def draw?
    self.over? && !self.won?
  end

  def winner
    if self.won? != false
      self.board.cells[self.won?[0]]
    end  
  end

  def turn
    turn = nil
    while !self.board.valid_move?(turn)
      turn = self.current_player.move(self.board)
      if self.board.valid_move?(turn)
        self.board.update(turn, self.current_player)
        break
      else
        puts "Invalid selection, please enter selection again."
      end
    end
  end

  def play
    until self.won? || self.draw?
      puts "#{self.board.display}"
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end


end
