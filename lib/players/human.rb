module Players
  class Human < Player

    def move(board)
      puts ""
      puts "#{board.display}"
      puts ""
      puts "Select which space you would like to move to: "
      gets
    end

  end
end
