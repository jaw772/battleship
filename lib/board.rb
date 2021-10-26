class Board
  attr_accessor :cells

  def initialize(cells)
    @cells = cells
  end

  def valid_coordinate?(check_cells = [])
    check_cells.all? {|cell| @cells.include?(cell)}
  end

  def valid_placement?(ship, check_cells = [])
    if check_cells.length == ship.length
      if check_cells.all? {|cell| @cells[cell].empty?}
        place_in_row?(check_cells) || place_in_column?(check_cells)
      else
        false
      end
    else
      false
    end
  end

  def place_in_row?(check_cells)
    # this will check that the first letter of each guess is the same
    if check_cells.sort.each_cons(2).all? {|one, two| one.ord == two.ord}
      #if first letter is the same checks if numbers are sequential
      seq_row = check_cells.map {|guess| guess[1]}
      seq_row.sort.each_cons(2).all? {|one, two| one.ord == two.ord - 1}
    else
      false
    end
  end

  def place_in_column?(check_cells)
    #this will check that the first letters are sequential
    if check_cells.sort.each_cons(2).all? {|one, two| one.ord == two.ord - 1}
      #if first letters are sequential then we can check the number is the same
      check_cells.map {|guess| guess[1]}.uniq.length == 1
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
    @cells.values.each do |cell|
      if cell.coordinate == "#{letter}1"
        @board_array << "\n#{letter} "
      end
      if cell.coordinate[0][0] == "#{letter}"
        @board_array << (cell.render(spot) + " ")
      end
    end
  end

  def render_board(spot = false)
    @board_array = ["  1 2 3 4 "]
    render_row(spot, "A")
    render_row(spot, "B")
    render_row(spot, "C")
    render_row(spot, "D")
    @board_array << "\n"
    @board_array.join
  end
end
