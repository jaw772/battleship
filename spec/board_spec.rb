require './lib/board'
require './lib/cell'

RSpec.describe Board do

  before(:each) do
    @board = Board.new
  end

  describe 'initialize' do
    it 'is a board' do
      expect(@board).to be_a(Board)
    end
  end

  describe 'cells method' do
    it 'creates cell objects' do
      expect(@board.cells).to be_a(Hash)
      expect(@board.cells.size).to eq(16)

      @board.cells.each do |cell|
        expect(cell.key).to be(Cell)
      end
    end
  end
  describe 'valid_coordinate?' do
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

  describe 'valid_placement?' do
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
end
