require "tty-box"
require "tty-font"
require "colorize"

# Render scoreboard method using counters from PlayerBatter class instance
def scoreboard (bases, home_runs, strikes, balls, outs)

    # Initialize tty-font for scoreboard title
    font = TTY::Font.new(:straight)
    heading = font.write("  BATTER-up!")

    # Clear terminal and initialize empty default bases
    system("clear")
    first_base = " "
    second_base = " "
    third_base = " "

    # If baserunner on base, replace with "x" to visualize baserunner
    bases[0] == 1 ? first_base = "x" : first_base = " "
    bases[1] == 1 ? second_base = "x" : second_base = " "    
    bases[2] == 1 ? third_base = "x" : third_base = " "

    # Render scoreboard in tty-box
    scoreboard_box = TTY::Box.frame(width: 100, height: 12, border: :thick, style: {
        border: {
            fg: :red,
            bg: :blue
        }
      }) do
    "#{heading}
                                                                                        [#{second_base}]
    ( #{home_runs.to_s} ) HOME RUNS                                                                   .'   '.
    ( #{strikes.to_s} ) STRIKES                                                                  [#{third_base}]  ( )  [#{first_base}]
    ( #{balls.to_s} ) BALLS                                                                       '.   .'
    ( #{outs.to_s} ) OUTS                                                                         |[ ]|
    " 
    end

    puts scoreboard_box
end