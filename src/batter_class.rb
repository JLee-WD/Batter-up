class PlayerBatter

    attr_accessor :strikes :balls :outs :home_runs :bases
    attr_reader :name

    def initialize(name)
        @name = name
        @strikes = 0
        @balls = 0
        @outs = 0
        @home_runs = 0
        @bases = []
    end

    def add_baserunners(hit_value)
        case hit_value
        when 1
            @bases.unshift(1)
        when 2
            @bases.unshift(0,1)
        when 3
            @bases.unshift(0,0,1)
        when 4
            @bases.unshift(0,0,0,1)
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

    def 1b_hit()
        puts "Line drive!"
        add_baserunners(1)
    end

    def 2b_hit()
        puts "Double!"
        add_baserunners(2)
    end

    def triple()
        puts "Triple!"
        add_baserunners(3)
    end

    def home_run()
        puts "HOME RUN!"
        add_baserunners(4)
    end

    def strike_count()
        @strikes += 1
        if @strikes == 3
            puts "Strikeout!"
            @outs += 1
    end

    def foul_or_ball(v)
        if v == "foul" && @balls < 3
            puts "Foul Ball!"
            @balls += 1
        elsif v == "ball"
            puts "Ball!"
            @balls += 1
            if @balls == 4
                puts "Ball 4! Batter walks..."
                add_baserunners(1)
                @strikes = 0
                @balls = 0
            end
        else
            puts "Foul Ball!"
        end
    end
    


end