class Board
  attr_accessor :cells

  def initialize(cells)
    @cells = cells
  end

  def valid_coordinate?(coordinate)
    coord_check = coordinate.split(//, 2)
    (coord_check[0] <= "D") && (coord_check[1].to_i <= 4)
  end

  def valid_placement?(ship, check_cells = [])

    # a valid placement will have the same number of cells as the ship length
    if check_cells.length == ship.length

      # a valid placement will have consecutive cells a1, a2, a3 or c1, c2, c3 for example
      #this will check that the first letter of each guess is the same
      if check_cells.sort.each_cons(2).all? {|one, two| one.ord == two.ord}

        #if first letter is the same checks if numbers are sequential
        seq_row = check_cells.map {|guess| guess[1]}
        seq_row.sort.each_cons(2).all? {|one, two| one.ord == two.ord - 1}

      #this one will check that the first letters are sequential
    elsif check_cells.sort.each_cons(2).all? {|one, two| one.ord == two.ord - 1}
        #if first letters are sequential then we can check the number is the same
        check_cells.map {|guess| guess[1]}.uniq.length == 1
      else
        false
      end
    else
      false
    end
  end

  def place(ship, cells_placed = [])
    cells_placed.each do |cell|
      @cells[cell].place_ship(ship)
    end

  end
end
