require 'minitest/autorun'
require_relative '../lib/encrlib'

class CaesarCipherTest < Minitest::Test
  def test_caesar_encrypts_english_alphabet
    assert_equal 'UVWXYZABCDEFGHIJKLMNOPQRSTuvwxyzabcdefghijklmnopqrst', caesar_cipher('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz', 20)
  end

  def test_caesar_encrypts_russian_alphabet
    assert_equal 'йклмнопрстуфхцчшщъыьэюяабвгдеёжзиЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯАБВГДЕЁЖЗИ', caesar_cipher('абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ', 10)
  end

  def test_caesar_encrypts_digits
    assert_equal '589', caesar_cipher('256', 3)
  end

  def test_caesar_keeps_other_symbols
    assert_equal '!@#$%^&*()/*-+.?|<>',viginere_cipher('!@#$%^&*()/*-+.?|<>', 121)
  end
end
