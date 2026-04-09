require 'minitest/autorun'
require_relative '../lib/encrlib/atbash'

class AtbashCipherTest < Minitest::Test
  def test_atbash_encrypts_english_text_upper
    original = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    encrypted = atbash_cipher(original)
    decrypted = atbash_cipher(encrypted)
    assert_equal original, decrypted
  end

  def test_atbash_encrypts_english_text_lower
    original = 'abcdefghijklmnopqrstuvwxyz'
    encrypted = atbash_cipher(original)
    decrypted = atbash_cipher(encrypted)
    assert_equal original, decrypted
  end

  def test_atbash_encrypts_russian_text_upper
    original = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'
    encrypted = atbash_cipher(original)
    decrypted = atbash_cipher(encrypted)
    assert_equal original, decrypted
  end

  def test_atbash_encrypts_russian_text_lower
    original = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя'
    encrypted = atbash_cipher(original)
    decrypted = atbash_cipher(encrypted)
    assert_equal original, decrypted
  end

  def test_atbash_encrypts_mixed_text
    original = 'abcdEFGHзийкЛМНО'
    encrypted = atbash_cipher(original)
    decrypted = atbash_cipher(encrypted)
    assert_equal original, decrypted
  end

  def test_atbash_keeps_other_characters
    original = '12345 !@#$'
    encrypted = atbash_cipher(original)
    decrypted = atbash_cipher(encrypted)
    assert_equal original, decrypted
  end
end
