module Players
    class Computer < Player

        
        WIN_COMBINATIONS  = [
    [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]
  ]
  
        def move(board)

            center = 5
            corners = [1,3,7,9]
            middles = [2,4,6,8]
            all = [1,3,7,9,2,4,6,8]
            possible_win_combo = []
            best_combos = [] 
            move_found = "no"
            move = nil

            while move_found != "yes"
                if board.valid_move?(5)                             #Move to middle first if possible
                    board.update(5, self)
                    move = "5"
                    # binding.pry
                    move_found = "yes"
                elsif board.taken?(5)
                    WIN_COMBINATIONS.each do |win_combo|             #Check for possible win combos
                        win_combo.each do |number|
                            if board.cells[number] == self.token
                                possible_win_combo << win_combo
                            end
                        end
                    end
                end

                possible_win_combo.each do |array|                          #Check for best combos
                    count = possible_win_combo.count(array)
                    if count > 1
                        best_combos << array
                    end

                end

                best_combos.uniq.each do |array|                           #Winning move if possible
                    array.each do |number|
                        if board.valid_move?(number + 1)
                            move = (number + 1).to_s
                            binding.pry
                            move_found = "yes"
                        end
                    end
                end
            
                possible_win_combo.each do |array|                           #Second best combo move if possible,corner first
                    array.each do |number|
                        if board.valid_move?(number + 1) && corners.include?(number + 1)
                            move = (number + 1).to_s
                            binding.pry
                            move_found = "yes"
                        elsif board.valid_move?(number + 1)
                            move = (number + 1).to_s
                            binding.pry
                            move_found = "yes"
                        else
                            all.each do |number|
                                if board.valid_move?(number)
                                    move = number.to_s
                                    move_found = "yes"
                                end
                            end
                        end
                    end         
                end 
            
                # corners.each do |corner|
                #     if board.valid_move?(corner)
                #         move = corner.to_s
                #         binding.pry
                #         move_found = "yes"
                #     end
                # end

                # middles.each do |middle|
                #     if board.valid_move?(middle)
                #         move = middle.to_s
                #         binding.pry
                #         move_found = "yes"
                #     end
                # end
                         
            end
            binding.pry
            move              
        end
  
    end
  end
  