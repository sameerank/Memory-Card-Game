require './card.rb'
require './board.rb'


class Game
  def initialize
    @board = Board.new
    @previous_pos = [nil, nil]
    @up_cards = []
  end

  def play
    @board.populate
    @board.render
    until @board.won? do
      guess_mem = []
      guess_mem << prompt
      @board.reveal(guess_mem[0])
      guess_mem << prompt
      @board.reveal(guess_mem[1])
      if @board.grid[guess_mem[0][0]][guess_mem[0][1]] != @board.grid[guess_mem[1][0]][guess_mem[1][1]]
        row = 0
        while row < @board.grid.length
          col = 0
          while col < @board.grid[0].length
            @board.grid[row][col].hide unless @up_cards.include?([row, col])
          col += 1
          end
        row += 1
        end
      else
        @up_cards.concat(guess_mem)
      end
    end
    puts "Congrats you won!"
  end

  def prompt
    puts "Pick a card. Which row?"
    row_input = Integer(gets.chomp)
    puts "And which column?"
    col_input = Integer(gets.chomp)
    [row_input, col_input]
  end

end
