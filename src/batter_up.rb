# class Batter
#     # define new player
#     def initialize(name)
#         @name = name
#     end

#     @strikes = 0
#     @outs = 0

#     def strike_count 
#         if @strikes == 3
#             outs_count()
#         elsif @strikes < 3
#             @strikes += 1
#         end
#     end

#     def outs_count
#         @outs += 1
#     end
# end

# outs = 0
# first_base = false
# second_base = false
# third_base = false

require "colorize"
require "./batter_class.rb"
require "tty-prompt"

prompt = TTY::Prompt.new

play_game = true

until play_game == false

    choice = prompt.select("Welcome to Batter-Up!", %w(Play High-Scores Exit))

    case choice
    when "Play"
        player = PlayerBatter.new(prompt.ask("Please enter your name: "))
        outs = player.outs

        until outs == 3
            swing = prompt.select("Choose your swing:", %w(Swing-High Swing-Mid Swing-Low No-Swing))

            system("clear")
            pitch = rand(1..15)
            swing_index = 0
    
            case swing 
            when "Swing-High"
                swing_index = 2..4
            when "Swing-Mid"
                swing_index = 7..9
            when "Swing-Low"
                swing_index = 12..14
            when "No-Swing"
                swing_index = 0
            end
    
            puts "Pitch: " + pitch.to_s
    
            if swing_index == 0
                if pitch === (2..4) || pitch === (7..9) || pitch === (12..14)
                    player.strike_count()
                else
                    player.foul_or_ball("ball")
                end
            elsif swing_index === pitch
                puts "HIT!"
                hit_index = rand(1..10)
                if (1..3) === hit_index
                    player.hit(1, "Line drive!")
                elsif (4..6) === hit_index 
                    player.hit(2, "Double!")
                elsif (7..8) === hit_index 
                    player.foul_or_ball("foul")
                elsif hit_index == 9
                    player.hit(3, "Triple!")
                elsif hit_index == 10
                    player.hit(4, "HOME RUN!!")
                end
            else
                player.strike_count()
                puts "Swing and a miss!"
            end

            puts "Strikes: " + player.strikes.to_s
            puts "Balls: " + player.balls.to_s
            p player.bases
            puts "Outs: " + player.outs.to_s
            puts "Home-Runs: " + player.home_runs.to_s
            outs = player.outs
        end
        puts "Game Over!"
    when "High-Scores"
        puts "High-Scores"
    when "Exit"
        play_game = false
    end
end






puts "game over!"