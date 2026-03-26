# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/encrlib'

class PlayfairCipherTest < Minitest::Test
  LETTER_MATRIX = [
    ['P', 'L', 'A', 'Y', 'F'],
    ['I', 'R', 'B', 'C', 'D'],
    ['E', 'G', 'H', 'K', 'M'],
    ['N', 'O', 'Q', 'S', 'T'],
    ['U', 'V', 'W', 'X', 'Z']
  ].freeze

  DIGIT_MATRIX = [
    ['0', '1', '2', '3'],
    ['4', '5', '6', '7'],
    ['8', '9', 'A', 'B'],
    ['C', 'D', 'E', 'F']
  ].freeze

  def test_playfair_decrypts_english_text
    assert_equal 'HELP', playfair_decipher('KGAL', LETTER_MATRIX)
  end

  def test_playfair_handles_odd_length
    assert_equal 'WORLD', playfair_decipher('VQGRCZ', LETTER_MATRIX)
  end

  def test_playfair_handles_double_letters
    assert_equal 'BALLOON', playfair_decipher('HBYVRVQO', LETTER_MATRIX)
  end

  def test_playfair_handles_digits
    assert_equal '1234', playfair_decipher('2307', DIGIT_MATRIX)
  end
end