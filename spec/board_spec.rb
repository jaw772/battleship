require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/cell_generator'

RSpec.describe Board do

  before(:each) do
    @cells = CellGenerator.new
    @board = Board.new(@cells)
  end

  describe '#initialize' do
    it 'is a board' do
      expect(@board).to be_a(Board)
    end
  end

  describe '#valid_coordinate?' do
    it 'returns boolean for valid coordinates' do
      expect(@board.valid_coordinate?("A1")).to be(true)
      expect(@board.valid_coordinate?("D4")).to be(true)
      expect(@board.valid_coordinate?("A5")).to be(false)
      expect(@board.valid_coordinate?("E1")).to be(false)
      expect(@board.valid_coordinate?("A22")).to be(false)
    end
  end

  before(:each) do
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  describe '#valid_placement?' do
    it 'has the same number of coordinates as the ship length' do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to be(false)
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to be(false)
    end
    it 'has consecutive coordinates' do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to be(false)
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to be(false)
      #should set up valid_placement to sort_by so these next two would be true
      expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to be(false)
      expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to be(false)
    end
    it "can't have diagonal coordinates" do
      expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to be(false)
      expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to be(false)
    end
    it 'is a valid placement' do
      expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to be(true)
      expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to be(true)
    end
  end

  describe '#place method' do
    it 'places ship within the coordinates' do
      expect(@board.place(@cruiser, ["A1", "A2", "A3"])).to eq ["S", "S", "S"]
    end

    it "cells contain a ship" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      cell_1 = @board.cells["A1"]
      cell_2 = @board.cells["A2"]
      cell_3 = @board.cells["A3"]
      expect(cell_1.ship).to eq @cruiser
      expect(cell_2.ship).to eq @cruiser
      expect(cell_3.ship).to eq @cruiser
      expect(cell_3.ship).to eq cell_2.ship
    end
  end

  describe '#valid_placement' do
    it "checks for overlapping" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(board.valid_placement?(@submarine, ["A1", "B1"])).to be false
      expect(board.valid_placement?(@submarine, ["B1", "C1"])).to be true
    end
  end

  describe '#render' do 
    it "cells render when placed" do
      @board.place(@cruiser, ["A1", "A2", "A3"])
      expect(@board.render).to eq "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
      expect(@board.render(true)).to eq "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"
    end
end
