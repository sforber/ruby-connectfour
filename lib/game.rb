class Game
    attr_accessor :places
    def initialize
        @places = [['','','','','','',''],
            ['','','','','','',''],
            ['','','','','','',''],
            ['','','','','','',''],
            ['','','','','','',''],
            ['','','','','','','']]
        @turn = 0
        @gameEnd = false
    end

    def mainLoop
        updateDisplay()
        while @gameEnd == false && @turn < 42
            puts "Player " + (@turn % 2 + 1).to_s + ", choose a column (1 - 7): "
            column = gets.to_i - 1
            while validPosition?(column) != true
                puts "Enter a valid position: "
                column = gets.to_i - 1
            end
            placePiece(column, @turn)
            updateDisplay()
            @turn += 1
        end
    end

    def updateDisplay
        puts "\n Display Updated \n"
    end
    
    def placePiece(column, turn)
        piece = whichPlayer?(turn)
        for i in (0..6) do
            if @places[i][column] == ''
                @places[i][column] = piece
                break
            end
        end
        puts @places[i][0]
    end

    def whichPlayer?(turn)
        if turn % 2 == 0
            return 'X'
        else
            return 'O'
        end
    end

    def validPosition?(column)
        if column >= 0 && column <= 6
            for i in (0..6) do
                if @places[i][column].empty?
                    return true
                end
            end
        end
    end

    def winCheck?

    end
end