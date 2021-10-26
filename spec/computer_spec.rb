require './lib/ship'
require './lib/cell'
require './lib/board'
require './lib/cell_generator'
require './lib/computer'

describe Computer do

  before(:each) do
    @npc_sub = Ship.new("Submarine", 2)
    @npc_cruiser = Ship.new("Cruiser", 3)
    @npc_cells = CellGenerator.new.cells
    @npc_board = Board.new(@npc_cells)
    @player_cells = CellGenerator.new.cells
    @player_board = Board.new(@player_cells)
    @npc = Computer.new(@npc_board, @player_board, @npc_sub, @npc_cruiser)
  end

  describe '#initialize' do
    it 'is a computer' do
      expect(@npc).to be_a(Computer)
    end
  end

  describe '#place_ships' do
    it 'places two ships' do
      @npc.npc_board.cells.values.all? {|cell| cell.ship == nil}
      #go through each cell and evaluate the ship
      @npc.place_ships(@npc_sub)
      @npc.place_ships(@npc_cruiser)

      expected = @npc.npc_board.cells.values.count {|cell| cell.ship != nil}
      expect(expected).to eq(5)
    end

    it 'has a cruiser and a sub' do
      @npc.place_ships(@npc_cruiser)
      @npc.place_ships(@npc_sub)
      expected = @npc.npc_board.cells.values.count do |cell|
        if cell.ship != nil
          cell.ship.name == "Cruiser"
        end
      end

      expect(expected).to eq(3)

      expected = @npc.npc_board.cells.values.count do |cell|
        if cell.ship != nil
          cell.ship.name == "Submarine"
        end
      end

      expect(expected).to eq(2)
    end

    describe '#fire' do
      it 'can shoot at the players board' do
        @npc.place_ships(@npc_sub)
        @npc.place_ships(@npc_cruiser)
        @npc.fire
        @npc.fire
        @npc.fire
        expected = @npc.player_board.cells.values.count {|cell| cell.shot_at == true}

        expect(expected).to eq(3)
      end
    end
  end
end
