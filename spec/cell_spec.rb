require './lib/ship'
require './lib/cell'


describe Cell do
  describe '#initialize' do
    it 'exists' do
      cell = Cell.new("B4")
      expect(cell).to be_a Cell
    end
    it 'takes a coordinate' do
      cell = Cell.new("B4")
      expect(cell.coordinate).to eq("B4")
    end
  end

  describe 'test methods' do
    it 'empty? returns boolean' do
      cell = Cell.new("B4")
      expect(cell.empty?).to be true

      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cell.empty?).to be false
    end

    it 'ship returns the ship object' do
      cell = Cell.new("B4")
      expect(cell.ship).to eq nil

      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
    end

    it 'fired_upon? returns boolean' do
      cell = Cell.new("B4")

      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cell.fire_upon?).to be false

      cell.fire_upon
      expect(cell.fired_upon?).to be true
    end

    it 'render gives a visual status of cells' do
      cell_1 = Cell.new("B4")
      cell_2 = Cell.new("B2")
      cell_3 = Cell.new("B3")

      cruiser = Ship.new("Cruiser", 3)
      cell_1.place_ship(cruiser)

      expect(cell_1.render).to eq(".")
      expect(cell_2.render).to eq(".")
      expect(cell_3.render).to eq(".")

      expect(cell_1.render(true)).to eq("S")

      cell_1.fire_upon
      expect(cell_1.fired_upon?).to be true
      expect(cell_1.render).to eq("H")

      cell_2.fire_upon
      expect(cell_2.render).to eq("M")

      cruiser.hit
      cruiser.hit
      expect(cruiser.sunk?).to be true
      expect(cell_1.render).to eq("X")
    end

  end

end
