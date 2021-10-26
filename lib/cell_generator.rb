require './lib/cell'

class CellGenerator
  attr_reader :coordinates

  def initialize(coordinates = Hash.new)
    @coordinates = coordinates
    @alphabet  = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
      "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
  end

  def cells(row, column)
    @row = row.to_i
    @column = column
    letter = @row - 1
    rows = ('A'..@alphabet[letter]).to_a
    columns = (('1'..@column).to_a)
    grid = rows.product(columns)
    grid = grid.map {|square| square.join}
    grid.each do |square|
      @coordinates[square] = Cell.new(square)
    end
    @coordinates
  end
end
