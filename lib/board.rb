class Board
  attr_accessor :cells
  def initialize(cells)
    @cells = cells
  end

  def valid_coordinate?(coordinate)
    coord_check = coordinate.split(//, 2)
    (coord_check[0] <= "D") && (coord_check[1].to_i <= 4)
  end
end 
