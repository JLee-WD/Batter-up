# Gems
require "colorize"
require "tty-prompt"

# Files
require_relative "./menu.rb"
require_relative "./batter_class.rb"
require_relative "./no_swing.rb"
require_relative "./swing.rb"
require_relative "./scoreboard.rb"
require_relative "./high_score.rb"
require_relative "./error_handling.rb"

# Initiate prompt
prompt = TTY::Prompt.new

# Game loop
play_game = true
until play_game == false

    # Animated menu plus menu prompt using tty-prompt gem
    menu()
    choice = prompt.select("Welcome to Batter-Up!", %w(Play High-Scores Exit))

    # Menu choice case statement
    case choice
    when "Play"

        # Instantiate PlayerBatter class when player selects play, with name input for high score record
        player_name = prompt.ask("Please enter your name: ")
        name_error(player_name)
        player = PlayerBatter.new(player_name)
        outs = player.outs


        # Batting system loop, game over at 3 outs
        until outs == 3

            # Retrieve/update counters from PlayerBatter instance
            bases = player.bases
            home_runs = player.home_runs
            strikes = player.strikes
            balls = player.balls
            outs = player.outs

            # Render scoreboard and visual interface, populated by counters
            scoreboard(bases, home_runs, strikes, balls, outs)
            no_swing(0, " ")

            # Player chooses swing, random pitch generated
            swing = prompt.select("Choose your swing:", %w(Swing-High Swing-Mid Swing-Low No-Swing))
            pitch = rand(1..15)

            # Chosen swing converted into integer range
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
    
            # If no swing, check if pitch is strike or ball
            if swing_index == 0
                if (2..4) === pitch || (7..9) === pitch || (12..14) === pitch
                    player.strike_count()
                    scoreboard(bases, home_runs, strikes, balls, outs)
                    no_swing(pitch, "STRIKE")
                    sleep(2)
                else
                    player.foul_or_ball("ball")
                    scoreboard(bases, home_runs, strikes, balls, outs)
                    no_swing(pitch, "BALL")
                    sleep(2)
                end

            # If swing chosen, and if pitch matches swing range, hit chance is calculated
            elsif swing_index === pitch
                scoreboard(bases, home_runs, strikes, balls, outs)
                hit_index = rand(1..10)
                if (1..3) === hit_index
                    player.hit(1)
                    swing(pitch, "Line drive!", swing_index)
                elsif (4..6) === hit_index 
                    player.hit(2)
                    swing(pitch, "Double!", swing_index)
                elsif (7..8) === hit_index 
                    player.foul_or_ball("foul")
                    swing(pitch, "Foul!", swing_index)
                elsif hit_index == 9
                    player.hit(3)
                    swing(pitch, "Triple", swing_index)
                elsif hit_index == 10
                    player.hit(4)
                    swing(pitch, "HOME RUN!!", swing_index)
                end
                sleep(2)

            # If swing chosen, and if pitch DOES NOT match swing range, add strike
            else
                player.strike_count()
                scoreboard(bases, home_runs, strikes, balls, outs)
                swing(pitch, "Swing and a miss!", swing_index)
                sleep(2)
            end
            outs = player.outs
        end

        # At 3 outs game over, add score to high scores to yaml file
        name = player.name
        add_high_score(name, home_runs)

        system("clear")
        puts "Game Over!"

    # If high-scores chosen from main menu, retrieve yaml and print in tty-table    
    when "High-Scores"
        puts retrieve_high_scores()
        prompt.select("Press enter to go back to the menu", %w(Back))

    # Exit game
    when "Exit"
        play_game = false
    end
end