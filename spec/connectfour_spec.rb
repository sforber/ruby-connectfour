require "./lib/game.rb"

describe "Game" do
    describe "#placePiece" do
        it "updates @places with the position of the players piece" do
            game = Game.new
            game.placePiece(0,0)
            expect(game.places[0][0]).to eql("X")
        end
    end

    describe "#validPosition?" do
        it "returns true if column entered is between 1 and 7" do
            game = Game.new
            expect(game.validPosition?(0)).to eql(true)
        end

        it "returns true if column entered has at least 1 empty space" do
            game = Game.new
            expect(game.validPosition?(0)).to eql(true)
        end

        it "returns false if column entered has no empty spaces" do
            game = Game.new
            game.places = [['X',' ',' ',' ',' ',' ',' '],
            ['X',' ',' ',' ',' ',' ',' '],
            ['X',' ',' ',' ',' ',' ',' '],
            ['X',' ',' ',' ',' ',' ',' '],
            ['X',' ',' ',' ',' ',' ',' '],
            ['X',' ',' ',' ',' ',' ',' ']]
            expect(game.validPosition?(0)).to eql(false)
        end
    end

    describe "#horizontalWin" do
        it "returns true if row contains four of the same symbols in a row" do
            game = Game.new
            game.places[0] = ['X','X','X','X',' ',' ',' ']
            expect(game.horizontalWin).to eql(true)
        end

        it "returns false if row does not contain four of the same symbols in a row" do
            game = Game.new
            game.places[0] = ['X','X','X','O',' ',' ',' ']
            expect(game.horizontalWin).to eql(false)
        end
    end

    describe "#verticalWin" do
        it "returns true if column contains four of the same symbols in a row" do
            game = Game.new
            game.places[0] = ['X',' ',' ',' ',' ',' ',' ']
            game.places[1] = ['X',' ',' ',' ',' ',' ',' ']
            game.places[2] = ['X',' ',' ',' ',' ',' ',' ']
            game.places[3] = ['X',' ',' ',' ',' ',' ',' ']
            expect(game.verticalWin).to eql(true)
        end

        it "returns false if column does not contain four of the same symbols in a row" do
            game = Game.new
            game.places[0] = ['X',' ',' ',' ',' ',' ',' ']
            game.places[1] = ['X',' ',' ',' ',' ',' ',' ']
            game.places[2] = ['X',' ',' ',' ',' ',' ',' ']
            game.places[3] = ['O',' ',' ',' ',' ',' ',' ']
            expect(game.verticalWin).to eql(false)
        end
    end

    describe "#diagonalWin" do
        it "returns true if there is a diagonal four of the same symbols" do
            game = Game.new
            game.places[0] = ['X',' ',' ',' ',' ',' ',' ']
            game.places[1] = [' ','X',' ',' ',' ',' ',' ']
            game.places[2] = [' ',' ','X',' ',' ',' ',' ']
            game.places[3] = [' ',' ',' ','X',' ',' ',' ']
            expect(game.diagonalWin).to eql(true)
        end

        it "returns false if there is a diagonal four of the same symbols" do
            game = Game.new
            game.places[0] = ['X',' ',' ',' ',' ',' ',' ']
            game.places[1] = [' ','O',' ',' ',' ',' ',' ']
            game.places[2] = [' ',' ','X',' ',' ',' ',' ']
            game.places[3] = [' ',' ',' ','X',' ',' ',' ']
            expect(game.diagonalWin).to eql(false)
        end
    end
end