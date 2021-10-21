class Board
  attr_accessor :cells
  def initialize(cells)
    @cells = cells
    @the_board = the_board
  end

  def valid_coordinate?(coordinate)
    coord_check = coordinate.split(//, 2)
    (coord_check[0] <= "D") && (coord_check[1].to_i <= 4)
  end

  def valid_placement?(ship, guesses = [])

    require 'pry'; binding.pry
    # a valid placement will have the same number of cells as the ship length
    ship.length == "cells guessed here.length"
    # a valid placement will have consecutive cells a1, a2, a3 or c1, c2, c3 for example
      # can use "A".ord and "D".ord to evaluate the numbers consecutive difference would
      # be equal to one
    # a valid placement will not have another ship in the cell already
    ship == cells[guesses]
    # no diagonal ships

    #check_row/check_column/column_num will be replaced by the guesses
    #this will check that the first letter of each guess is the same
    check_row.sort.each_cons(2).all? {|one, two| one.ord == two.ord}

    #this one will check that the first letters are sequential
    check_column.sort.each_cons(2).all? {|one, two| one.ord == two.ord - 1}

    #if first letters are sequential then we can check the column number is the same
    column_num.map {|guess| guess[1]}.uniq.length == 1

    #if first letter is the same checks if numbers are sequential in a column
    seq_col = guess.map {|guess| guess[1]}
    seq_col.sort.each_cons(2).all? {|one, two| one.ord == two.ord - 1}
  end
  def create_board
    board = CellGenerator.new()
    @the_board = board.cells
  end
  def place(ship, coords)
    coords.each do |coord|
      @cell = @the_board.values[coord]
      @cell.place_ship(ship)
      @the_board[@cell]
    end
  end
  def render
    puts "  1 2 3 4"
    print "A "
    @the_board.values.each do |cell|
      if cell.coordinate[0][0] == "A"
        print "#{cell.render(true)} "
      end
    end
    puts
    print "B "
    @the_board.values.each do |cell|
      if cell.coordinate[0][0] == "B"
        print "#{cell.render(true)} "
      end
    end
    puts
    print "C "
    @the_board.values.each do |cell|
      if cell.coordinate[0][0] == "C"
        print "#{cell.render(true)} "
      end
    end
    puts
    print "D "
    @the_board.values.each do |cell|
      if cell.coordinate[0][0] == "D"
        print "#{cell.render(true)} "
      end
    end

end
