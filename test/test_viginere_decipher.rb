# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/encrlib'

class ViginereCipherTest < Minitest::Test
  def test_viginere_round_trip_for_english_text
    source = 'DefendTheEastWall'
    key = 'Fort'

    encrypted = viginere_cipher(source, key)

    assert_equal source, viginere_decipher(encrypted, key)
  end

  def test_viginere_round_trip_with_mixed_content
    source = 'Secret-42: meet at 19:30.'
    key = 'Key42'

    encrypted = viginere_cipher(source, key)

    assert_equal source, viginere_decipher(encrypted, key)
  end

  def test_viginere_supports_cyrillic_round_trip
    source = 'Текст 987'
    key = 'Ключ'

    encrypted = viginere_cipher(source, key)

    assert_equal source, viginere_decipher(encrypted, key)
  end
end