# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/encrlib'

class RailFenceDecipherTest < Minitest::Test
  def test_rail_fence_decrypts_classic_example
    assert_equal 'WEAREDISCOVEREDFLEEATONCE', rail_fence_decipher('WECRLTEERDSOEEFEAOCAIVDEN', 3)
  end

  def test_rail_fence_round_trip_with_mixed_text
    source = 'Привет, Ruby 2026!'
    encrypted = rail_fence_cipher(source, 4)

    assert_equal source, rail_fence_decipher(encrypted, 4)
  end
end