require './lib/ship'

RSpec.describe Ship do

  describe 'default values' do
    it 'Instance of ship' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser).to be_a Ship
    end

    it 'has a name' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.name).to eq('Cruiser')
    end

    it 'has a length and health' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.length).to eq(3)
      expect(cruiser.health).to eq(3)
    end
  end

  describe 'sunk? and hit methods'  do
    it 'can take a hit' do
      cruiser = Ship.new("Cruiser", 3)

      expect(cruiser.health).to eq(3)

      cruiser.hit

      expect(cruiser.health).to eq(2)

      cruiser.hit
      cruiser.hit

      expect(cruiser.health).to eq(0)
    end

    it 'is sunk?' do
      cruiser = Ship.new("Cruiser", 3)


      cruiser.hit
      cruiser.hit

      expect(cruiser.sunk?).to be(false)

      cruiser.hit

      expect(cruiser.sunk?).to be(true)
    end
  end
end
