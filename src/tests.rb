require_relative "./batter_class.rb"
require_relative "./high_score.rb"
require_relative "./menu.rb"
require_relative "./no_swing.rb"
require_relative "./swing.rb"
require_relative "./scoreboard.rb"

require "minitest/autorun"

# Instance method tests
class TestClass < Minitest::Test

    # Test instance variables have instansiated properly
    def test_initialized_instance_variables
        test_batter = PlayerBatter.new("test")
        assert test_batter.strikes != nil
        assert test_batter.name != nil
        assert_kind_of Array,  test_batter.bases
    end

    # Test instance hit method is adding to bases array & testing if runner reaches 4th base, 1 added to home runs
    def test_hit_method
        test_batter = PlayerBatter.new("test")
        test_batter.hit(1)
        assert test_batter.bases == [1]
        test_batter.hit(3)
        assert test_batter.bases == [0,0,1]
        assert test_batter.home_runs == 1
    end

    # Test strike count method & if 3 strikes equals an out
    def test_strike_count_method
        test_batter = PlayerBatter.new("test")
        test_batter.strike_count()
        assert test_batter.strikes == 1
        test_batter.strike_count()
        test_batter.strike_count()
        assert test_batter.strikes == 0
        assert test_batter.outs == 1
    end

    # Test foul or ball method, fouls at 3 balls should not add a ball
    def test_foul_or_ball_method
        test_batter = PlayerBatter.new("test")
        test_batter.foul_or_ball("foul")
        test_batter.foul_or_ball("ball")
        assert test_batter.balls == 2
        test_batter.foul_or_ball("ball")
        test_batter.foul_or_ball("foul")
        assert test_batter.balls == 3
        test_batter.foul_or_ball("ball")
        assert test_batter.balls == 0
        assert test_batter.bases == [1]
    end
end

# Test high score methods
class TestHighScore < Minitest::Test
    def test_retrieve_high_scores
        assert retrieve_high_scores() != nil
    end
end