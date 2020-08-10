class Game
    attr_accessor :places
    def initialize
        @places = [[' ',' ',' ',' ',' ',' ',' '],
        [' ',' ',' ',' ',' ',' ',' '],
        [' ',' ',' ',' ',' ',' ',' '],
        [' ',' ',' ',' ',' ',' ',' '],
        [' ',' ',' ',' ',' ',' ',' '],
        [' ',' ',' ',' ',' ',' ',' ']]
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
            if winCheck? == true
                @gameEnd = true
                puts "\nCongratulations Player #{@turn % 2 + 1}, you win!"
            else
                @turn += 1
            end

        end
    end

    def updateDisplay
        system 'clear'
        board = ''
        reversePlaces = [[],[],[],[],[],[]]
        for row in (0..5)
            reversePlaces[5 - row] = @places[row]
        end
        board += "\n1|2|3|4|5|6|7"
        for row in (0..5)
            board += "\n#{reversePlaces[row][0]}|#{reversePlaces[row][1]}|#{reversePlaces[row][2]}|#{reversePlaces[row][3]}|#{reversePlaces[row][4]}|#{reversePlaces[row][5]}|#{reversePlaces[row][6]} "
        end
        puts board + "\n\n\n"
    end
    
    def placePiece(column, turn)
        piece = whichPlayer?(turn)
        for i in (0..5) do
            if @places[i][column] == " "
                @places[i][column] = piece
                break
            end
        end
    end

    def whichPlayer?(turn)
        if turn % 2 == 0
            return 'X'
        else
            return 'O'
        end
    end

    def validPosition?(column)
        valid = false
        if column >= 0 && column <= 6
            for i in (0..5) do
                if @places[i][column] == " "
                    valid = true
                    return valid
                end
            end
        end
        return valid
    end

    def winCheck?
        if horizontalWin == true
            return true 
        elsif verticalWin == true
            return true
        elsif diagonalWin == true
            return true        
        end
    end

    def horizontalWin
        for row in (0..5)
            for column in (0..3)
                if @places[row][column] == @places[row][column + 1] && @places[row][column] == @places[row][column + 2] && @places[row][column] == @places[row][column + 3] && @places[row][column] != " "
                    return true
                end
            end
        end
        return false
    end 

    def verticalWin
        for column in (0..6)
            if @places[0][column] == @places[1][column] && @places[0][column] == @places[2][column] && @places[0][column] == @places[3][column] && @places[0][column] != " "
                return true
            end
        end
        return false
    end 

    def diagonalWin
        for row in (0..2)
            for column in (0..2)
                if @places[row][column] == @places[row + 1][column + 1] && @places[row][column] == @places[row + 2][column + 2] && @places[row][column] == @places[row + 3][column + 3] && @places[row][column] != " "
                    return true
                end
            end
            for column in (3...4)
                if @places[row][column] == @places[row][column + 1] && @places[row][column] == @places[row][column + 2] && @places[row][column] == @places[row][column + 3] && @places[row][column] != " "
                    return true
                elsif @places[row][column] == @places[row + 1][column - 1] && @places[row][column] == @places[row + 2][column - 2] && @places[row][column] == @places[row + 3][column - 3] && @places[row][column] != " "
                    return true 
                end
            end
            for column in (4..6)
                if @places[row][column] == @places[row + 1][column - 1] && @places[row][column] == @places[row + 2][column - 2] && @places[row][column] == @places[row + 3][column - 3] && @places[row][column] != " "
                    return true
                end 
            end
        end
        return false
    end
end