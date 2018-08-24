require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test
  def setup
    @robot = Robot.new
  end
  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    setup
    @robot.needs_repairs = true
    @robot.foreign_model = 'kia'

    # act
    expected_value = 1
    actual_value = @robot.station

    assert_equal(expected_value, actual_value)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    @robot.needs_repairs = true
    @robot.vintage_model = 'ford'
    # act
    expected = 2
    actual = @robot.station
    # assert
    assert_equal(expected, actual)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3

    # arrange
    @robot.needs_repairs = true
    # act
    expected = 3
    actual = @robot.station
    # assert
    assert_equal(expected, actual)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange

    # act
    expected = 4
    actual = @robot.station
    # assert
    assert_equal(expected, actual)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange

    # act
    expected = -1
    actual = @robot.prioritize_tasks
    # assert
    assert_equal(expected, actual)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    @robot.todos = [1, 2, 3]
    # act
    expected = 3
    actual = @robot.prioritize_tasks
    # assert
    assert_equal(expected, actual)
  end

  def test_workday_on_day_off_returns_false
    # arrange
    @robot.day_off = 'Saturday'
    # act
    expected = false
    actual = @robot.workday?('Saturday')
    # assert
    assert_equal(expected, actual)
  end

  def test_workday_not_day_off_returns_true
    # arrange
    @robot.day_off = 'Saturday'
    # act
    expected = true
    actual = @robot.workday?('Monday')
    # assert
    assert_equal(expected, actual)
  end

end
