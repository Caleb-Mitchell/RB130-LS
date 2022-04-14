=begin

Write a program that can score a bowling game.

Bowling is game where players roll a heavy ball to knock down pins arranged in a triangle. Write code to keep track of the score of a game of bowling.
Scoring Bowling

The game consists of 10 frames. A frame is composed of one or two ball throws with 10 pins standing at frame initialization. There are three cases for the tabulation of a frame.

    An open frame is where a score of less than 10 is recorded for the frame. In this case the score for the frame is the number of pins knocked down.

    A spare is where all ten pins are knocked down after the second throw. The total value of a spare is 10 plus the number of pins knocked down in their next throw.

    A strike is where all ten pins are knocked down after the first throw. The total value of a strike is 10 plus the number of pins knocked down in their next two throws. If a strike is immediately followed by a second strike, then we can not total the value of first strike until they throw the ball one more time.

Here is a three frame example:
Frame 1   Frame 2   Frame 3
X (strike)   5/ (spare)   9 0 (open frame)

Frame 1 is (10 + 5 + 5) = 20

Frame 2 is (5 + 5 + 9) = 19

Frame 3 is (9 + 0) = 9

This means the current running total is 48.

The tenth frame in the game is a special case. If someone throws a strike or a spare then they get a fill ball. Fill balls exist to calculate the total of the 10th frame. Scoring a strike or spare on the fill ball does not give the player more fill balls. The total value of the 10th frame is the total number of pins knocked down.

For a tenth frame of X1/ (strike and a spare), the total value is 20.

For a tenth frame of XXX (three strikes), the total value is 30.
Requirements

Write code to keep track of the score of a game of bowling. It should support two operations:

    roll(pins) is called each time the player rolls a ball. The argument is the number of pins knocked down.

    score() is called only at the very end of the game. It returns the total score for that game.

=end

class Game
  def initialize
    @running_score = 0
  end

  def roll(pins)
    start_strike if strike?(pins)
    tally_strike(pins) if @strike_rolled
    reset_strike if @post_strike_balls == 2

    @running_score += pins unless strike?(pins)
  end

  def score
    @running_score
  end

  private

  def strike?(pins)
    pins == 10
  end

  def start_strike
    @strike_rolled = true
    @post_strike_balls = -1
    @strike_value = 0
  end

  def tally_strike(pins)
    @post_strike_balls += 1
    @strike_value += pins
  end

  def reset_strike
    @strike_rolled = false
    @running_score += @strike_value
    @post_strike_balls = 0
  end
end

require 'minitest/autorun'
# require_relative 'bowling'

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_should_be_able_to_score_open_frame
    # skip
    @game.roll(3)
    @game.roll(4)
    roll_n_times(18, 0)
    assert_equal 7, @game.score
  end

  def test_should_be_able_to_score_multiple_frames
    # skip
    [3, 4, 2, 3, 5, 2].each do |pins|
      @game.roll pins
    end
    roll_n_times(14, 0)
    assert_equal 19, @game.score
  end

  def test_should_score_a_game_with_all_gutterballs
    # skip
    roll_n_times(20, 0)
    assert_equal 0, @game.score
  end

  def test_should_score_a_game_with_all_single_pin_rolls
    # skip
    roll_n_times(20, 1)
    assert_equal 20, @game.score
  end

  def test_should_allow_game_with_all_open_frames
    # skip
    roll_n_times(10, [3, 6])
    assert_equal 90, @game.score
  end

  def test_should_correctly_score_a_strike_that_is_not_on_the_last_frame
    # skip
    @game.roll(10)
    @game.roll(5)
    @game.roll(3)
    roll_n_times(16, 0)

    assert_equal 26, @game.score
  end

  def test_should_score_a_spare_that_is_not_on_the_last_frame
    # skip
    @game.roll(5)
    @game.roll(5)
    @game.roll(3)
    @game.roll(4)
    roll_n_times(16, 0)

    assert_equal 20, @game.score
  end

  def test_should_score_multiple_strikes_in_a_row
    skip
    @game.roll(10)
    @game.roll(10)
    @game.roll(10)
    @game.roll(5)
    @game.roll(3)
    roll_n_times(12, 0)

    assert_equal 81, @game.score
  end

    def test_should_score_multiple_spares_in_a_row
    skip
    @game.roll(5)
    @game.roll(5)
    @game.roll(3)
    @game.roll(7)
    @game.roll(4)
    @game.roll(1)
    roll_n_times(14, 0)

    assert_equal 32, @game.score
  end

  def test_should_allow_fill_balls_when_the_final_frame_is_strike
    skip
    roll_n_times(18, 0)
    @game.roll(10)
    @game.roll(7)
    @game.roll(1)

    assert_equal 18, @game.score
  end

  def test_should_allow_fill_ball_in_last_frame_if_spare
    skip
    roll_n_times(18, 0)
    @game.roll(9)
    @game.roll(1)
    @game.roll(7)

    assert_equal 17, @game.score
  end

  def test_should_allow_fill_balls_to_be_strike
    skip
    roll_n_times(18, 0)
    @game.roll(10)
    @game.roll(10)
    @game.roll(10)

    assert_equal 30, @game.score
  end

  def test_should_score_a_perfect_game
    skip
    roll_n_times(12, 10)
    assert_equal 300, @game.score
  end

  def test_should_not_allow_rolls_with_negative_pins
    skip
    assert_raises(
      StandardError,
      'Pins must have a value from 0 to 10') do
        @game.roll(-1)
      end
  end

  def test_should_not_allow_rolls_better_than_strike
    skip
    assert_raises(
      StandardError,
      'Pins must have a value from 0 to 10') do
        @game.roll(11)
      end
  end

  def test_should_not_allow_two_normal_rolls_better_than_strike
    skip
    assert_raises StandardError, 'Pin count exceeds pins on the lane' do
      @game.roll(5)
      @game.roll(6)
    end
  end

  def test_should_not_allow_two_normal_rolls_better_than_strike_in_last_frame
    skip
    roll_n_times(18, 0)
    assert_raises StandardError, 'Pin count exceeds pins on the lane' do
      @game.roll(10)
      @game.roll(5)
      @game.roll(6)
    end
  end

  def test_should_not_allow_to_take_score_at_the_beginning
    skip
    assert_raises(
      StandardError,
      'Score cannot be taken until the end of the game',
    ) do
      @game.score
    end
  end

  def test_should_not_allow_to_take_score_before_game_has_ended
    skip
    roll_n_times(19, 5)
    assert_raises(
      StandardError,
      'Score cannot be taken until the end of the game') do
        @game.score
      end
  end

  def test_should_not_allow_rolls_after_the_tenth_frame
    skip
    roll_n_times(20, 0)
    assert_raises(
      StandardError,
      'Should not be able to roll after game is over',
    ) do
      @game.roll(0)
    end
  end

  def test_should_not_calculate_score_before_fill_balls_have_been_played
    skip
    roll_n_times(10, 10)

    assert_raises StandardError, 'Game is not yet over, cannot score!' do
      @game.score
    end
  end

  def roll_n_times(rolls, pins)
    rolls.times do
      Array(pins).each { |value| @game.roll(value) }
    end
  end
  private :roll_n_times
end
