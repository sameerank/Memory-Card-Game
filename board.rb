require './card.rb'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(2) { Array.new(2) }
    @values = ["a", "a", "b", "b"].shuffle

  end

  def [](row, col)
    @grid[row][col]
  end

  def populate
    iterator = 0
    row = 0
    while row < @grid.length
      col = 0
      while col < @grid[0].length
        @grid[row][col] = Card.new(@values[iterator])
        iterator += 1
        col += 1
      end
      row += 1
    end
  end

def render
  @grid.each.with_index do |row, rowindex|
    rowdata = ""
    row.each do |card|
        rowdata << card.to_s
    end
    puts rowdata
  end
end

  def won?
    @grid.flatten.all? { |card| card.face_up }
  end

  def reveal(guessed_pos)
    row, col = guessed_pos
    @grid[row][col].reveal
    render
  end
end
