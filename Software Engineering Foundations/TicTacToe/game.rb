class Game
    def initialize(n, **args)
        @players = []
        args.each do |mark|
            key = mark[0]
            value = mark[1]
            
            if value
                @players << ComputerPlayer.new(key)
            else
                @players << HumanPlayer.new(key)
            end
        end
        @board = Board.new(n)

        @currPlayer = @players[0]
    end

    def switch_turn
        @players.rotate!
        @currPlayer = @players[0]
    end
    
    def play
        #while board has empty pos
        while @board.empty_positions?
            #print board
            @board.print
            puts "-----"
            #get pos from current player
            pos = @currPlayer.get_position(@board.legal_positions)
            mark = @currPlayer.mark
            #place mark
            @board.place_mark?(pos,mark)
            self.switch_turn
            #check if win
            if @board.win?(mark)
                p 'victory'
                @board.clear
                return
            end
        end
        p 'Draw'
        @board.clear
    end

    def print
        @board.print
    end

end