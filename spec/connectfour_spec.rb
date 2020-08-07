require "./lib/game.rb"

describe "Game" do
    describe "#placePiece" do
        it "updates @places with the position of the players piece" do
            game = Game.new
            game.placePiece(0,0)
            expect(game.places[6][0]).to eql("X")
        end
    end

    describe "#validPosition?" do
        it "returns true if column entered is between 1 and 7" do
            game = Game.new
            expect(game.validPosition?(0)).to eql(true)
        end

        it "returns true if column entered has at least 1 empty space" do
            game = Game.new
            game.places[4][0], game.places[5][0], game.places[6][0] = 'X', 'X', 'X'
            expect(game.validPosition?(0)).to eql(true)
        end

        it "returns false if column entered has at no empty spaces" do
            game = Game.new
            game.places[0][0], game.places[1][0], game.places[2][0], game.places[3][0], game.places[4][0], game.places[5][0], game.places[6][0] = 'X', 'X', 'X', 'X', 'X', 'X', 'X'
            expect(game.validPosition?(0)).to eql(false)
        end
    end
end