require './lib/cell'
require './lib/board'
require './lib/cell_generator'

RSpec.describe CellGenerator do

  before(:each) do
    @cell_generator = CellGenerator.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@cell_generator).to be_a(CellGenerator)
    end
  end

  describe '#cells method' do
    it 'creates cell objects' do
      expect(@cell_generator.cells).to be_a(Hash)
      expect(@cell_generator.cells.size).to eq(16)

      @cell_generator.cells.values.each do |cell|
        expect(cell.class).to be(Cell)
      end
    end
  end
end
