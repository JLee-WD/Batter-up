# Main player class to keep track of counters, i.e. strikes, balls, outs, runs, bases
# Class instance methods act upon and keep track of the counters
class PlayerBatter
    attr_accessor :strikes, :balls, :outs, :home_runs, :bases
    attr_reader :name

    # Instance initialized with below
    def initialize(name)
        @name = name
        @strikes = 0
        @balls = 0
        @outs = 0
        @home_runs = 0
        @bases = []
    end

    # Reset balls and strikes method
    def reset()
        @strikes = 0
        @balls = 0
    end

    # If a hit is detected, add base runner and reset 
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
        
        # Add home-run if baserunner makes it to home base
        until @bases.length < 4
            if @bases[-1] == 1
                @home_runs += 1
                @bases.pop
            else
                @bases.pop
            end
        end
    end

    # Add strike to strike count, if 3 strikes add out and reset
    def strike_count()
        @strikes += 1
        if @strikes === 3
            puts "Strikeout!"
            @outs += 1
            reset()
        end
    end

    # If a foul ball from a hit, add ball if count is less than 3
    # Else add ball, if 4 balls batter walks to first, reset
    def foul_or_ball(v)
        if v == "foul" && @balls < 3
            @balls += 1
        elsif v == "ball"
            @balls += 1
            if @balls == 4
                hit(1)
                reset()
            end
        else
            puts "Foul Ball!"
        end
    end
end