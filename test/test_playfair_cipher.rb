# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/encrlib'

class PlayfairCipherTest < Minitest::Test
  LETTER_MATRIX_ENGLISH_BIG = [
    ['P', 'L', 'A', 'Y', 'F'],
    ['I', 'R', 'B', 'C', 'D'],
    ['E', 'G', 'H', 'K', 'M'],
    ['N', 'O', 'Q', 'S', 'T'],
    ['U', 'V', 'W', 'X', 'Z']
  ].freeze

  LETTER_MATRIX_ENGLISH_SMALL = [
    ['p', 'l', 'a', 'y', 'f'],
    ['i', 'r', 'b', 'c', 'd'],
    ['e', 'g', 'h', 'k', 'm'],
    ['n', 'o', 'q', 's', 't'],
    ['u', 'v', 'w', 'x', 'z']
  ].freeze

    LETTER_MATRIX_RUSSIAN_BIG = [
    ['А', 'Б', 'В', 'Г', 'Д'],
    ['Е', 'Ж', 'З', 'И', 'К'],
    ['Л', 'М', 'Н', 'О', 'П'],
    ['Р', 'С', 'Т', 'У', 'Ф'],
    ['Х', 'Ц', 'Ч', 'Ш', 'Щ']
  ].freeze

  LETTER_MATRIX_RUSSIAN_SMALL = [
    ['а', 'б', 'в', 'г', 'д'],
    ['е', 'ж', 'з', 'и', 'к'],
    ['л', 'м', 'н', 'о', 'п'],
    ['р', 'с', 'т', 'у', 'ф'],
    ['х', 'ц', 'ч', 'ш', 'щ']
  ].freeze

  DIGIT_MATRIX = [
    ['0', '1', '2', '3'],
    ['4', '5', '6', '7'],
    ['8', '9', 'A', 'B'],
    ['C', 'D', 'E', 'F']
  ].freeze

  def test_playfair_encrypts_english_text_big
    assert_equal 'KGAL', playfair_cipher('HELP', LETTER_MATRIX_ENGLISH_BIG)
  end

  def test_playfair_encrypts_english_text_small
    assert_equal 'kgal', playfair_cipher('help', LETTER_MATRIX_ENGLISH_SMALL)
  end

  def test_playfair_encrypts_russian_text_big
    assert_equal 'ЛФЗГЗРОЖХА', playfair_cipher('ПРИВЕТМИР', LETTER_MATRIX_RUSSIAN_BIG)
  end

  def test_playfair_encrypts_russian_text_small
    assert_equal 'лфзгзрожха', playfair_cipher('приветмир', LETTER_MATRIX_RUSSIAN_SMALL)
  end

  def test_playfair_handles_odd_length
    assert_equal 'VQGRCZ', playfair_cipher('WORLD', LETTER_MATRIX_ENGLISH_BIG)
  end

  def test_playfair_handles_double_letters
    assert_equal 'HBYVRVQO', playfair_cipher('BALLOON', LETTER_MATRIX_ENGLISH_BIG)
  end

  def test_playfair_removes_spaces
    assert_equal playfair_cipher('HELLOWORLD', LETTER_MATRIX_ENGLISH_BIG),
                 playfair_cipher('HELLO WORLD', LETTER_MATRIX_ENGLISH_BIG)
  end

  def test_playfair_handles_digits
    assert_equal '2307', playfair_cipher('1234', DIGIT_MATRIX)
  end
end