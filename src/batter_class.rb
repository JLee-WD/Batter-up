class PlayerBatter
    attr_accessor :strikes, :balls, :outs, :home_runs, :bases
    attr_reader :name

    def initialize(name)
        @name = name
        @strikes = 0
        @balls = 0
        @outs = 0
        @home_runs = 0
        @bases = []
    end

    def hit(hit_value)
        case hit_value
        when 1
            @bases.unshift(1)
            reset()
        when 2
            @bases.unshift(0,1)
            reset()
        when 3
            @bases.unshift(0,0,1)
            reset()
        when 4
            @bases.unshift(0,0,0,1)
            reset()
        end
        
        until @bases.length < 4
            if @bases[-1] == 1
                @home_runs += 1
                @bases.pop
            else
                @bases.pop
            end
        end
    end

    def reset()
        @strikes = 0
        @balls = 0
    end

    def strike_count()
        @strikes += 1
        if @strikes === 3
            puts "Strikeout!"
            @outs += 1
            reset()
        end
    end

    def foul_or_ball(v)
        if v == "foul" && @balls < 3
            @balls += 1
        elsif v == "ball"
            @balls += 1
            if @balls == 4
                hit(1, "Ball 4! Batter walks...")
                reset()
            end
        else
            puts "Foul Ball!"
        end
    end

    

end