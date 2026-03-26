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

  def test_playfair_encrypts_english_text
    assert_equal 'KGAL', playfair_cipher('HELP', LETTER_MATRIX)
  end

  def test_playfair_handles_odd_length
    assert_equal 'VQGRCZ', playfair_cipher('WORLD', LETTER_MATRIX)
  end

  def test_playfair_handles_double_letters
    assert_equal 'HBYVRVQO', playfair_cipher('BALLOON', LETTER_MATRIX)
  end

  def test_playfair_removes_spaces
    assert_equal playfair_cipher('HELLOWORLD', LETTER_MATRIX),
                 playfair_cipher('HELLO WORLD', LETTER_MATRIX)
  end

  def test_playfair_handles_digits
    assert_equal '2307', playfair_cipher('1234', DIGIT_MATRIX)
  end
end