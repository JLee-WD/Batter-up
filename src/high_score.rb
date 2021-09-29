require 'yaml'

def add_high_score(name, home_runs) 
    high_scores = YAML.load(File.read("high_scores.yml"))
    # p high_scores

    if home_runs == 0
        
    elsif home_runs >= high_scores[0][:score].to_i
        new_high_scores = high_scores.unshift({name: name.to_s, score: home_runs.to_i})
    else
        i = 0
        until i == high_scores.length.to_i
            x = high_scores[i][:score].to_i
            y = high_scores[i.to_i + 1][:score].to_i

            if (home_runs <= x) && (home_runs >= y)
                puts i
                new_high_scores =  high_scores.insert(i, {name: name.to_s, score: home_runs.to_i})
            end
            i += 1
        end
    end

    File.open("high_scores.yml", "w") { |file|
        file.write(high_scores.to_yaml)
    }
end

add_high_score("Jeremy", 2)
