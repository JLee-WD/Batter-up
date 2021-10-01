# **Batter up!**

# **T1A3 Terminal app - Justin Lee**

Github Repo: [Link](https://github.com/JLee-WD/Batter-up)

## **_Software Development Plan_**

## 1. Purpose & Scope

The terminal app I chose to develop is one that is based off classic baseball games I played when I was a kid. One of my earliest memories of playing video games was with my original brick gameboy playing baseball with mario and luigi. I aim to recreate those nostalgic gaming experiences into a terminal baseball game using Ruby. The purpose would be purely for entertainment and nostalgic value.

The app will simulate one baseball innings at-bat. Baseball rules apply, 3 strikes for an out, 4 balls for a walk and 3 outs to end the inning. After starting the app and selecting play. This will prompt the player to enter their name (for recording a high-score). The game will now start and the player as the batter will be able to select 4 actions in the strikezone, high swing, mid swing, low swing, or no swing. The app will randomly generate and visualize the pitch, and provide feedback on the result. Depending on the swing, the outcome can either be a hit, strike, foul or a ball. If it is a hit, the type of hit outcome will be calculated to be either a 1-base hit, 2-base hit, 3-base hit, home run or foul ball. The baserunners will be visualized in a baseunning tracker on the scoreboard. Just like real baseball, batter must strategize whether to go for hits to get on base quicker but risk striking-out, or not swinging at all and walking batters on base. The game will end once there are 3 outs, and the goal will be to score as many home-runs as possible. High-scores will be saved and displayed at the main menu.

The target audience for this app are baseball enthusiasts, gaming enthusiasts, or anyone who is knowledgable with coding or Ruby in particular. The app itself will also showcase my ability to create a working terminal game using ruby.

The app will not solve any particular problem as it is a game created for entertainment purposes.

## 2. Features

> - Error handling

The first feature is the main component of the app, the batting system. This system includes: randomly generating the pitch matching it against the chosen swing using ruby gem "Tty-prompt", and the hit chance outcome calculator. The batting system is located in the `main.rb file`. When the game starts, the game enters the first loop which breaks then the player's outs equals 3. The player selects an action from a prompt, swing high, mid, low or no-swing, and a random pitch is generated. The high swing holds the value as a range of the top of the strikezone, the mid swing holds the mid range of the strikezone, and the low swing holds the low range of the strikezone. If the generated pitch matches up with the chosen swing range, it becomes a hit. The hit is allocated a random integer, and the outcomes are represented as ranges. This way, the outcomes can be adjusted to raise or lower the chance of that outcome. For example, there is a higher chance of a 1 base or 2 base hit(`1..3, 4..6` respectively), and a low chance of a 3 base or home run hit(`3, 4` respectively). If the player choose not to swing, the generated pitch can either be a strike or a ball. At this point, the outcome is saved in the PlayerBatter class. Once 3 outs are recorded the loop and thus the game, ends.

The second feature is the PlayerBatter class which stores the `@strikes`, `@balls`, `@outs`, `@home_runs` and `@bases` as instance variables. The class, which is located in `batter_class.rb` is instansiated when the player enters their name at the start of the game. The above instance variables are central to keeping track of the game's operation at any given time. The game itself is driven by the values of these variables. At the start of the game, all default values are `0` with the exception of the name, which is a string, and the bases, which is an array. When a strike occurs in main.rb, the instance method `strike_count()` is called which adds 1 to `@strikes`, and checks if strikes equals 3. If so, it adds 1 to `@outs`, then resets balls and strikes back to 0 with the instance method `reset()`. If a hit occurs, the instance method `hit()` takes in one parameter and passes it through a case statement. Depending on the integer passed in from the hit (`1` for one base hit, `2` for two base hit etc.), the case statement will add the respective values to represent the baserunner position. For example, if the hit passes in a 2 base hit the method will `unshift(0,1)` to `@bases` array. If the hit passes in a 3 base hit the method will `unshift(0,0,1)` to `@bases` array and so forth. It then does a check, if `@bases` exceeds the length of 3, it enters a loop and adds the baserunners(which are have a value of 1) to `@home_runs` and removes them from the array. It will loop until `@bases` is less than 4. The last method in the class is `foul_or_ball()` which takes in one string as a parameter. If the string is `"foul"`, the method will check if `@balls` is less than 3, if so it will add 1(This is because in baseball, a foul ball can't force a 4-ball walk). If the method passes the string `"ball"`, it will add 1 to `@balls`, then checks if `@balls` equals 4. If so, then it calls the `hit()` method to move the batter to first base. It then resets the strike and ball count with `reset()`. Finally if both conditions are not met, the `else` outcome is a `puts` which states `"Foul Ball!"`.

The third feature is the scoreboard located in `scoreboard.rb`. The scoreboard enhances user interaction by visually displaying the current counters of the game as easy-to-read strings in the terminal. The player will use this information to strategize their next action to move forward in the game. For example, if bases are loaded and there are 0 strikes, a smart player will swing. The scoreboard consists of a the game title, counter tracker and baserunner tracker. The scoreboard itself is encompassed in a box, created by the ruby gem "Tty-box". The advantage of using this gem, is that all elements are contained with the box at a set width and height. The `scoreboard()` method takes in parameters `bases, home_runs, strikes, balls` and `outs`. It displays the `home_runs, strikes, balls` and `outs` into a counter tracker on the left side of the board, by simply passing the values into a large string encompassed by a box-frame. This string also holds the baserunner tracker on the far right side of the scoreboard box. The baserunner tracker is visualized as a representation of the four bases. `@bases` array is passed in as parameter `bases`, which represents the position of the bases as an array of integers `1` or `0`, 1 being a baserunner, and 0 being no runner. If index 0 of `@bases` array has the value `1`, then the first base on the tracker is shown with an `x`. This is the same for index 1 (second base), and index 2 (third base). The method utilizes ternery's to assess the array's values. The last element of the scoreboard is simply the game's title "Batter-up!" shown using the ruby gem "Tty-font".

The fourth feature is the batter/pitcher visualization. The two methods that display the batter and pitcher are located in `swing.rb` and `no_swing.rb` and are named as such. If the player chooses to swing, the method `swing()` is called in `main.rb` with parameters `pitch`, `text` and `swing_index` passed in. The method will use the integer from `pitch`, validate it from a case statement which contains all of the possible pitch locations, and changes the pitch location from an empty string `" "` to `"O"`. The method does a similar operation with the passed in `swing_index` to visualize the chosen swing. Both of these operations, plus the passed in `text` are shown in the batter/pitcher graphic, which is wrapped in a "Tty-box" set at the same width as the box for the scoreboard to keep the overall interface consistent. This method will visualize to the player, the pitch and swing along with a batter and pitcher figure in an easy to recognize interface.

The fifth feature is functionality of saving and retrieving high scores. Utilizing `yaml`, there are two methods inside `high_score.rb`. The first is `retrieve_high_scores()`. This method loads the `high_scores.yml` file containing an array of hashes of high score records. Each hash contains two key-value pairs. The first of which with of symbol `:name`, has the value as a string which was the players name. The second with the symbol `:score` has its value as an integer which was the players final score. The method retrieves this array and arranges the top 5 hashes (sorted by `:score`) into a table supplied by "tty-table". The second method is named `add_high_score()`. This method takes in two parameters, `name` and `home_runs` from the recent game. First, the method retrieves the `high_scores.yml` file and assigns it to a local variable named `high_scores`. A new hash is then created from the parameters `name` and `home_runs`. This new hash is inserted to the front of the `high_scores` array, which is then sorted through a while loop. The loop compares the `:score` of the first item of the array against the `:score` of the second item in the array. If the first item `:score` is less than the second item's `:score`, then it swaps their positions. The loop will check all items in the array and swaps the elements that are out of order. The array `high_scores` is now updated with the new hash, and sorted in descending order. The method then saves this array to the `high_scores.yml`.

The final feature is the animated menu. This feature is fairly simple. Using the ruby gem "tty-font", the game title "Batter-Up!" is displayed in a box. This title is replicated 20 times into 20 different variables. For each variable in order, the title is reduced from the left at the same spacing. The variables are then printed in order, separated by `system("clear")` to clear the console, and `sleep(0.05)` to delay the reveal of each variable. This gives the effect that the title slides in from the left to the right when the game is loaded.

### User interaction and Experience

> - How the user will find out how to interact with / use each feature
> - How the user will interact with / use each feature
> - How errors will be handled by the application and displayed to the user

The user will interact with the features in this app with the aid of ruby gem "Tty-prompt". Prompt is used at the main menu, when selecting `Play Game`, `High Scores` or `Exit`. The user will use their arrow keys to move up or down, and press enter to select the menu items. Similarly, during the game the player will select the swing with the same prompt. Using prompt removes unknown input from the user, thus removing errors stemming from user input.

### Control Flow Diagram

> - Show the workflow/logic and/or integration of the features in your application for each feature.
> - Utilise a recognised format or set of conventions for a control flow diagram, such as UML.

Batting System Control Flow Diagram
![Batting System Control Flow Diagram](./docs/Baseball_Flowchart.png)

### Implementation Plan

> - Outlines how each feature will be implemented and a checklist of tasks for each feature
> - Prioritise the implementation of different features, or checklist items within a feature
> - Provide a deadline, duration or other time indicator for each feature or checklist/checklist-item
>
> Utilise a suitable project management platform to track this implementation plan
>
> Your checklists for each feature should have at least 5 items.

Minimal Viable Product features:

1. Batting System
1. Scoreboard
1. Baserunning tracker

Extra features

1. High Score tracker
1. Additional graphic animations
1. More in-depth hit-chance batting system
1. Expanding game length to 9 innings
1. Implement batter skill to affect hit rates
1. Implement pitcher skill to affect chances of strikes

### Installation

> - Describe how to use and install the application.
>
> You must include:
>
> - Steps to install the application
> - Any dependencies required by the application to operate
> - Any system/hardware requirements
> - Ruby gems

- Ruby Gems

1. Bundler
1. TTY-font
1. TTY-box
1. TTY-prompt
1. Colorize (for string colouring)
1. Paint (includes effects)
1. Require all

- Tests

1. RSPEC
