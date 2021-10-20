class CellGenerator
  attr_reader :coordinates

  def initialize(coordinates = Hash.new)
    @coordinates = coordinates
  end

  def cells
    rows = ('A'..'D').to_a
    columns = (('1'..'4').to_a)#*4
    grid = rows.product(columns)
    grid = grid.map {|square| square.join}
    grid.each do |square|
      @coordinates[square] = Cell.new(square)
    end
    @coordinates
  end
end
