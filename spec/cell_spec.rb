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

  describe '#empty?' do
    it 'returns true when empty' do
      cell = Cell.new("B4")
      expect(cell.empty?).to be true
    end

    it 'returns false when cell is occupied' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cell.empty?).to be false
    end
  end

  describe '#ship' do
    it 'returns nil when the ship is not in the cell' do
      cell = Cell.new("B4")
      expect(cell.ship).to eq nil
    end

    it 'returns the ship object when it is in the cell' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cell.ship).to eq(cruiser)
    end
  end

  describe '#fired_upon?' do
    it 'returns false when the cell has been fired upon' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.place_ship(cruiser)
      expect(cell.fired_upon?).to be false
    end

    it 'returns true when the cell has been fired upon' do
      cell = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell.fired_upon
      expect(cell.fired_upon?).to be true
    end
  end

  describe '#render' do
    it 'displays . when the cell has not been fired upon' do
      cell_1 = Cell.new("B2")
      cell_2 = Cell.new("B3")
      cell_3 = Cell.new("B4")
      cruiser = Ship.new("Cruiser", 3)
      cell_1.place_ship(cruiser)
      expect(cell_1.render).to eq(".")
      expect(cell_2.render).to eq(".")
      expect(cell_3.render).to eq(".")
    end

    it 'displays S in the cell when the optional argument is used' do
      cell_1 = Cell.new("B2")
      cruiser = Ship.new("Cruiser", 3)
      cell_1.place_ship(cruiser)
      expect(cell_1.render(true)).to eq("S")
    end

    it 'displays H when a ship has been hit in the cell' do
      cell_1 = Cell.new("B2")
      cruiser = Ship.new("Cruiser", 3)
      cell_1.fired_upon
      expect(cell_1.fired_upon?).to be true
      expect(cell_1.render).to eq("H")
    end

    it 'displays M when a cell is fired upon but is a miss' do
      cell_2 = Cell.new("B3")
      cruiser = Ship.new("Cruiser", 3)
      cell_2.fired_upon
      expect(cell_2.render).to eq("M")
    end

    it 'displays X when a ship has sunk' do
      cell_1 = Cell.new("B2")
      cruiser = Ship.new("Cruiser", 3)
      cruiser.hit
      cruiser.hit
      cruiser.hit
      expect(cruiser.sunk?).to be true
      expect(cell_1.render).to eq("X")
    end
  end
end
