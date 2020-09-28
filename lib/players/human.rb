module Players
  class Human < Player

    def move(input)
      puts "Select which space you would like to move to: "
      gets
    end

  end
end
