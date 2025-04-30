require 'minitest/autorun'

class BottlesTest < Minitest::Test
  def test_the_first_verse
    expected =
      "99 bottles of beer on the wall, " +
      "99 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "98 bottles of beer on the wall.\n"
    assert_equal expected, Bottles.new.verse(99)
  end

  def test_another_verse
    expected =
      "3 bottles of beer on the wall, " +
      "3 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "2 bottles of beer on the wall.\n"
    assert_equal expected, Bottles.new.verse(3)
  end

  def test_verse_2
    expected =
      "2 bottles of beer on the wall, " +
      "2 bottles of beer.\n" +
      "Take one down and pass it around, " +
      "1 bottle of beer on the wall.\n"
    assert_equal expected, Bottles.new.verse(2)
  end

  def test_verse_1
    expected =
    "1 bottle of beer on the wall, " +
    "1 bottle of beer.\n" +
    "Take it down and pass it around, " +
    "no more bottles of beer on the wall.\n"
  assert_equal expected, Bottles.new.verse(1)
  end

  def test_verse_0
    expected =
    "No more bottles of beer on the wall, " +
    "no more bottles of beer.\n" +
    "Go to the store and buy some more, " +
    "99 bottles of beer on the wall.\n"
  assert_equal expected, Bottles.new.verse(0)
  end

  def test_verses_99_98
    bottles = Bottles.new
    expected =
    bottles.verse(99) + "\n" +
    bottles.verse(98)
    assert_equal expected, bottles.verses(99,98)
  end
end

class Bottles
  def verse(number)
    "#{bottlecount(number).capitalize} #{container(number)} of beer on the wall, "+
    "#{bottlecount(number)} #{container(number)} of beer.\n" +
    "#{action(number)}, "+
    "#{bottlecount(thenext(number))} #{container(thenext(number))} of beer on the wall.\n"
  end

  def verses(a,b)
    a.downto(b).collect { |i| verse(i)}.join("\n")
  end

  def song
    verses(99,0)
  end

  def container(number)
    BottleNumber.new(number).container
  end

  def pronoun(number)
    BottleNumber.new(number).pronoun
  end

  def bottlecount(number)
    BottleNumber.new(number).bottlecount
  end

  def action(number)
    BottleNumber.new(number).action
  end

  def thenext(number)
    BottleNumber.new(number).thenext
  end
end

class BottleNumber
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def container
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def pronoun
    if number == 1
      "it"
    else
      "one"
    end
  end

  def bottlecount
    if number == 0
      "no more"
    else
      number.to_s
    end
  end

  def action
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{pronoun} down and pass it around"
    end
  end

  def thenext
    if number == 0
      99
    else
      number - 1
    end
  end
end
