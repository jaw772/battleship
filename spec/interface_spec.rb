require './lib/interface'

RSpec.describe Interface do

  before(:each) do
    @cruiser = Ship.new('Cruiser', 3)
    @submarine = Ship.new('Submarine', 2)
    @npc_sub = Ship.new("Submarine", 2)
    @npc_cruiser = Ship.new("Cruiser", 3)
    @interface = Interface.new
  end

  describe 'Interface' do
    it 'exists' do
      expect(@interface.class).to be_a(Interface)
    end
  end

  describe '#setup_game' do
    xit 'instantiates all game variables' do
      @interface.setup_game
      expect(@interface)
    end
  end

  describe '#take_turn' do
    it 'will play until the computer or players ships are all sunk' do
      @interface.setup_game
      expected = (@npc_cruiser.sunk? == true && @npc_sub.sunk? == true) || (@cruiser.sunk? == true && @submarine.sunk? == true)

      expect(expected).to eq(true)
    end
  end
end
