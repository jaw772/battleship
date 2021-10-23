require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/cell_generator'
require './lib/computer'

describe Computer do

  before(:each) do
    @cells = CellGenerator.new.cells
    @board = Board.new(@cells)
    @comp = Computer.new
  end

  describe '#initialize' do
    it 'is a computer' do
      expect(@comp).to be_a(Computer)
    end
  end

  

end
