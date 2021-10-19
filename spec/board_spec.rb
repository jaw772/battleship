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
end
