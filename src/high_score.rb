require 'yaml'
require "tty-table"

def add_high_score(name, home_runs) 

    # retrieve current high scores from yaml file
    high_scores = YAML.load(File.read("high_scores.yml"))

    # create new record from recent game
    new_record = {name: name.to_s, score: home_runs.to_i}

    # add new record to start of current high scores array
    high_scores.unshift(new_record)

    # loop through current high scores, sorting the new record to the correct place, highest first
    i = 0
    while i < high_scores.length - 1

        if high_scores[i][:score] < high_scores[i + 1][:score]
            high_scores[i], high_scores[i + 1] = high_scores[i + 1], high_scores[i]
        end
        i += 1
    end

    # write new high scores array with new record to yaml file
    File.open("high_scores.yml", "w") { |file|
        file.write(high_scores.to_yaml)
    }
end

def retrieve_high_scores()
    high_scores = YAML.load(File.read("high_scores.yml"))
    # renderer = TTY::Table::Renderer::Unicode.new(table)

    table = TTY::Table.new(
        ["Name","Score"], 
        [
        [high_scores[0][:name], high_scores[0][:score]], 
        [high_scores[1][:name], high_scores[1][:score]], 
        [high_scores[2][:name], high_scores[2][:score]], 
        [high_scores[3][:name], high_scores[3][:score]], 
        [high_scores[4][:name], high_scores[4][:score]]
        ]
        )

    return table.render(:unicode, padding: [0,3,0,3])
end


