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
end