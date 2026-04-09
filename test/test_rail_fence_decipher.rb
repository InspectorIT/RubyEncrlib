# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/encrlib/rail_fence'

class RailFenceDecipherTest < Minitest::Test
  def test_rail_fence_decrypts_classic_example
    assert_equal 'WEAREDISCOVEREDFLEEATONCE', rail_fence_decipher('WECRLTEERDSOEEFEAOCAIVDEN', 3)
  end

  def test_rail_fence_round_trip_with_mixed_text1
    source = 'Привет, Ruby 2026!'
    encrypted = rail_fence_cipher(source, 4)

    assert_equal source, rail_fence_decipher(encrypted, 4)
  end

  def test_rail_fence_decrypts_with_two_rails
    assert_equal 'ATTACKATDAWN', rail_fence_decipher('ATCADWTAKTAN', 2)
  end

  def test_rail_fence_decrypts_with_three_rails
    assert_equal 'HELLOWORLD', rail_fence_decipher('HOLELWRDLO', 3)
  end

  def test_rail_fence_decrypts_digits_and_symbols
    assert_equal '12345-!', rail_fence_decipher('135!24-', 2)
  end

  def test_rail_fence_decrypts_cyrillic_and_spaces
    encrypted = 'П, рт y2!иеRb06вu2'

    assert_equal 'Привет, Ruby 2026!', rail_fence_decipher(encrypted, 4)
  end

  def test_rail_fence_round_trip_with_mixed_text2
    source = 'Secret + Секрет: 42!'
    encrypted = rail_fence_cipher(source, 4)

    assert_equal source, rail_fence_decipher(encrypted, 4)
  end

  def test_rail_fence_keeps_input_for_single_rail
    assert_equal 'abc', rail_fence_decipher('abc', 1)
  end

  def test_rail_fence_keeps_input_when_key_is_zero_or_negative
    assert_equal 'abc', rail_fence_decipher('abc', 0)
    assert_equal 'abc', rail_fence_decipher('abc', -3)
  end

  def test_rail_fence_keeps_input_when_text_is_too_short
    assert_equal 'x', rail_fence_decipher('x', 5)
    assert_equal '', rail_fence_decipher('', 4)
  end

  def test_rail_fence_keeps_input_when_key_is_larger_than_text
    assert_equal 'abc', rail_fence_decipher('abc', 5)
  end
end