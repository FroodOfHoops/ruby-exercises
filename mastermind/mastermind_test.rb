require 'minitest/autorun'
require_relative 'mastermind'

class CodeCheck < Minitest::Test
  def test_code_check1
    expected = [4, 0]
    assert_equal expected, Game.new.compare("YGBO", "YGBO")
  end
  def test_code_check2
    expected = [1, 1]
    assert_equal expected, Game.new.compare("YGBO", "PRBY")
  end
  def test_code_check3
    expected = [0, 1]
    assert_equal expected, Game.new.compare("YGBO", "BBPB")
  end
  def test_code_check4
    expected = [0, 2]
    assert_equal expected, Game.new.compare("OGBB", "BBPY")
  end
  def test_grading1
    expected = "Correctly placed: 4\n" +
    "Incorrectly placed: 0"
    assert_equal expected, Game.new.grade([4,0])
  end
  def test_grading2
    expected = "Correctly placed: 1\n" +
    "Incorrectly placed: 1"
    assert_equal expected, Game.new.grade([1,1])
  end
  def test_grading3
    expected = "Correctly placed: 0\n" +
    "Incorrectly placed: 1"
    assert_equal expected, Game.new.grade([0,1])
  end
  def test_grading4
    expected = "Correctly placed: 0\n" +
    "Incorrectly placed: 2"
    assert_equal expected, Game.new.grade([0,2])
  end
  def test_error1_1
    expected = 1
    assert_equal expected, Game.new.checkvalid("foo")
  end
  def test_error1_2
    expected = 1
    assert_equal expected, Game.new.checkvalid("booop")
  end
  def test_error1_3
    expected = 1
    assert_equal expected, Game.new.checkvalid(69)
  end
  def test_error2_1
    expected = 2
    assert_equal expected, Game.new.checkvalid("ABYG")
  end
  def test_error2_2
    expected = 2
    assert_equal expected, Game.new.checkvalid("OO6O")
  end
  def test_error2_3
    expected = 2
    assert_equal expected, Game.new.checkvalid("!B!B")
  end
  def test_valid1
    expected = 3
    assert_equal expected, Game.new.checkvalid("BYPR")
  end
  def test_valid2
    expected = 3
    assert_equal expected, Game.new.checkvalid("OOOO")
  end
  def test_valid3
    expected = 3
    assert_equal expected, Game.new.checkvalid("GBGB")
  end
#  def test_codegen
#    expected = 3
#    assert_equal expected, Game.choose_code() ...
#  end
end