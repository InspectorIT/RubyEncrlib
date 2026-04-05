# frozen_string_literal: true


# string encryption with Atbash cipher|шифрование строки шифром Атбаш
# @param str [String] input string|исходная строка
# @return [String] encrypted string|зашифрованная строка
def atbash_cipher(str)
  upper_rus = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'
  lower_rus = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя'
  upper_eng = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  lower_eng = 'abcdefghijklmnopqrstuvwxyz'

  encstr = ''
  str.each_char do |ch|
    if (idx = upper_rus.index(ch))
      encstr += upper_rus[-1 - idx]
    elsif (idx = lower_rus.index(ch))
      encstr += lower_rus[-1 - idx]
    elsif (idx = upper_eng.index(ch))
      encstr += upper_eng[-1 - idx]
    elsif (idx = lower_eng.index(ch))
      encstr += lower_eng[-1 - idx]
    else
      encstr += ch
    end
  end
  encstr
end

# string encryption with Rail Fence cipher|Шифрование строки методом Железнодорожной изгороди
# @param str [String] input string|исходная строка
# @param key [Integer] rails count|количество рельс
# @return [String] encrypted string|зашифрованная строка
def rail_fence_cipher(str, key)
  return str if key <= 1 || str.size <= 1

  rails = Array.new(key) { '' }
  rail = 0
  direction = 1

  str.each_char do |ch|
    rails[rail] += ch

    direction = 1 if rail.zero?
    direction = -1 if rail == key - 1
    rail += direction
  end

  rails.join
end

# string decryption with Rail Fence cipher|Расшифровка строки методом Железнодорожной изгороди
# @param str [String] encrypted string|зашифрованная строка
# @param key [Integer] rails count|количество рельс
# @return [String] decrypted string|исходная строка
def rail_fence_decipher(str, key)
  return str if key <= 1 || str.size <= 1

  pattern = []
  rail = 0
  direction = 1

  str.size.times do
    pattern << rail

    direction = 1 if rail.zero?
    direction = -1 if rail == key - 1
    rail += direction
  end

  rail_lengths = Array.new(key, 0)
  pattern.each { |idx| rail_lengths[idx] += 1 }

  rails = []
  cursor = 0
  rail_lengths.each do |len|
    rails << str[cursor, len].chars
    cursor += len
  end

  rail_positions = Array.new(key, 0)
  decstr = ''

  pattern.each do |idx|
    decstr += rails[idx][rail_positions[idx]]
    rail_positions[idx] += 1
  end

  decstr
end