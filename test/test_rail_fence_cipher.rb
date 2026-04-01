# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/encrlib'

class RailFenceCipherTest < Minitest::Test
  def test_rail_fence_encrypts_classic_example
    assert_equal 'WECRLTEERDSOEEFEAOCAIVDEN', rail_fence_cipher('WEAREDISCOVEREDFLEEATONCE', 3)
  end

  def test_rail_fence_keeps_short_or_single_rail_input
    assert_equal 'abc', rail_fence_cipher('abc', 1)
    assert_equal 'x', rail_fence_cipher('x', 5)
  end
end