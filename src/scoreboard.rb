# require "tty-prompt"
require "tty-box"
require "tty-font"

def scoreboard (bases, home_runs, strikes, balls, outs)
    # prompt = TTY::Prompt.new
    font = TTY::Font.new(:straight)

    heading = font.write("  BATTER-up!")

    system("clear")
    first_base = " "
    second_base = " "
    third_base = " "

    bases[0] == 1 ? first_base = "x" : first_base = " "
    bases[1] == 1 ? second_base = "x" : second_base = " "    
    bases[2] == 1 ? third_base = "x" : third_base = " "


    scoreboard_box = TTY::Box.frame(width: 100, height: 12, border: :thick) do
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