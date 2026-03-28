# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/encrlib'

class ViginereCipherTest < Minitest::Test
  def test_viginere_encrypts_english_text
    assert_equal 'LXFOPVEFRNHR', viginere_cipher('ATTACKATDAWN', 'LEMON')
  end

  def test_viginere_repeats_short_key_automatically
    assert_equal 'bcdef', viginere_cipher('abcde', 'b')
  end

  def test_viginere_handles_digits
    assert_equal '5791', viginere_cipher('1234', '4567')
  end

  def test_viginere_keeps_non_supported_symbols_untouched
    source = 'api-key: v1.2.3'
    encrypted = viginere_cipher(source, 'ruby')

    assert_equal '-', encrypted[3]
    assert_equal ':', encrypted[7]
    assert_equal '.', encrypted[11]
    assert_equal '.', encrypted[13]
  end

  def test_viginere_encrypts_russian_text
    assert_equal 'ЪьжщпюКаы', viginere_cipher('ПриветМир', 'Ключ')
  end

  def test_vigenere_with_single_letter_key
    assert_equal 'Бвг Деёж', viginere_cipher('Абв Гдее', 'Б')
  end

  def test_vigenere_key_longer_than_text
    assert_equal 'Юзнпбц', viginere_cipher('Привет', 'ОченьДлинныйКлюч')
  end
end