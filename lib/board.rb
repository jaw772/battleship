class Board
  attr_accessor :cells

  def initialize(cells)
    @cells = cells
  end

  def valid_coordinate?(check_cells = [])
    check_cells.all? {|cell| @cells.include?(cell)}
  end

  def valid_placement?(ship, check_cells = [])

    # a valid placement will have the same number of cells as the ship length
    if check_cells.length == ship.length
      if check_cells.all? {|cell| @cells[cell].empty?}

        # a valid placement will have consecutive cells a1, a2, a3 or c1, c2, c3 for example
        #this will check that the first letter of each guess is the same
        if check_cells.sort.each_cons(2).all? {|one, two| one.ord == two.ord}

        #if first letter is the same checks if numbers are sequential
        seq_row = check_cells.map {|guess| guess[1]}
        seq_row.sort.each_cons(2).all? {|one, two| one.ord == two.ord - 1}

        # true #see if this returns a true to check the interface conditions

        #this one will check that the first letters are sequential
        elsif check_cells.sort.each_cons(2).all? {|one, two| one.ord == two.ord - 1}
        #if first letters are sequential then we can check the number is the same
        check_cells.map {|guess| guess[1]}.uniq.length == 1

        # true #see if this returns a true to check the interface conditions

        else
          false
        end
      else
        false
      end
    else
      false
    end
  end

  def place(ship, cells_placed = [])
    if valid_coordinate?(cells_placed) && valid_placement?(ship, cells_placed)
      cells_placed.each do |cell|
        @cells[cell].place_ship(ship)
      end
      true
    else
      puts "Unless you're playing on a different board than me those are invalid coordinates. Why don't you try again?"
    end
  end

  def render_row(spot = false, letter)
    board_array = ["  1 2 3 4 "]
  #create render row. take in an argument a letter to associate with each row
  #can then use for extensions
    @cells.values.each do |cell|
      if cell.coordinate == "#{letter}1"
        board_array << "/n#{letter} "
      end
      if cell.coordinate[0][0] == "#{letter}"
        board_array << (cell.render(spot) + " ")
      end
    end
    board_array << "\n"
    board_array.join
  end
end
