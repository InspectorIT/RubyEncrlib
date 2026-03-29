# frozen_string_literal: true
# string encryption with Caesar cipher|Шифрование строки методом Цезаря
# @param str [String] input string|исходная строка
# @param key [Integer] amount to move|сдвиг
# @return [String] encrypted string|зашифрованная строка
def caesar_cipher(str, key)
  encstr = ''
  upper_rus = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'
  lower_rus = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя'

  str.chars.each do |x|
    y = if upper_rus.include?(x)
          idx = upper_rus.index(x)
          new_idx = (idx + key) % 33
          upper_rus[new_idx]
        elsif lower_rus.include?(x)
          idx = lower_rus.index(x)
          new_idx = (idx + key) % 33
          lower_rus[new_idx]
        elsif x.ord in 65..90
          (((x.ord - 65 + key) % 26) + 65).chr(Encoding::UTF_8)
        elsif x.ord in 97..122
          (((x.ord - 97 + key) % 26) + 97).chr(Encoding::UTF_8)
        elsif x.ord in 48..57
          (((x.ord - 48 + key) % 10) + 48).chr(Encoding::UTF_8)
        else
          x
        end
    encstr += y
  end
  encstr
end

# string decryption with Caesar cipher|Расшифровка строки методом Цезаря
# @param str [String] encrypted string|зашифрованная строка
# @param key [Integer] amount to move|сдвиг
# @return [String] decrypted string|исходная строка
def caesar_decipher(str, key)
  encstr = ''
  upper_rus = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'
  lower_rus = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя'

  str.chars.each do |x|
    y = if upper_rus.include?(x)
          idx = upper_rus.index(x)
          new_idx = (idx - key) % 33
          upper_rus[new_idx]
        elsif lower_rus.include?(x)
          idx = lower_rus.index(x)
          new_idx = (idx - key) % 33
          lower_rus[new_idx]
        elsif x.ord in 65..90
          (((x.ord - 65 - key) % 26) + 65).chr(Encoding::UTF_8)
        elsif x.ord in 97..122
          (((x.ord - 97 - key) % 26) + 97).chr(Encoding::UTF_8)
        elsif x.ord in 48..57
          (((x.ord - 48 - key) % 10) + 48).chr(Encoding::UTF_8)
        else
          x
        end
    encstr += y
  end
  encstr
end

# string encryption with Viginere cipher/Шифрование строки методом Виженера
# @param str [String] input string|исходная строка
# @param key [String] key word|ключевое слово
# @return [String] encrypted string|зашифрованная строка
def viginere_cipher(str, key)
  encstr = ''
  key += key while key.size < str.size

  # Полные алфавиты (русский с Ё/ё, английский)
  upper_rus = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'
  lower_rus = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя'
  upper_eng = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  lower_eng = 'abcdefghijklmnopqrstuvwxyz'

  (0..str.size - 1).each do |x|
    y = if upper_rus.include?(str[x])
          idx_key = if upper_rus.include?(key[x])
                      upper_rus.index(key[x])
                    elsif lower_rus.include?(key[x])
                      lower_rus.index(key[x])
                    elsif upper_eng.include?(key[x])
                      upper_eng.index(key[x])
                    elsif lower_eng.include?(key[x])
                      lower_eng.index(key[x])
                    else
                      0
                    end
          upper_rus[(upper_rus.index(str[x]) + idx_key) % 33]
        elsif lower_rus.include?(str[x])
          idx_key = if lower_rus.include?(key[x])
                      lower_rus.index(key[x])
                    elsif upper_rus.include?(key[x])
                      upper_rus.index(key[x])
                    elsif lower_eng.include?(key[x])
                      lower_eng.index(key[x])
                    elsif upper_eng.include?(key[x])
                      upper_eng.index(key[x])
                    else
                      0
                    end
          lower_rus[(lower_rus.index(str[x]) + idx_key) % 33]
        elsif str[x].ord in 65..90
          idx_key = if upper_eng.include?(key[x])
                      upper_eng.index(key[x])
                    elsif lower_eng.include?(key[x])
                      lower_eng.index(key[x])
                    elsif upper_rus.include?(key[x])
                      upper_rus.index(key[x])
                    elsif lower_rus.include?(key[x])
                      lower_rus.index(key[x])
                    else
                      0
                    end
          ((str[x].ord - 65 + idx_key) % 26 + 65).chr(Encoding::UTF_8)
        elsif str[x].ord in 97..122
          idx_key = if lower_eng.include?(key[x])
                      lower_eng.index(key[x])
                    elsif upper_eng.include?(key[x])
                      upper_eng.index(key[x])
                    elsif lower_rus.include?(key[x])
                      lower_rus.index(key[x])
                    elsif upper_rus.include?(key[x])
                      upper_rus.index(key[x])
                    else
                      0
                    end
          ((str[x].ord - 97 + idx_key) % 26 + 97).chr(Encoding::UTF_8)
        elsif str[x].ord in 48..57
          idx_key = if key[x].ord in 48..57
                      key[x].ord - 48
                    else
                      0
                    end

          ((str[x].ord - 48 + idx_key) % 10 + 48).chr(Encoding::UTF_8)
        else
          str[x]
        end
    encstr += y
  end
  encstr
end

# string decryption with Viginere cipher|Расшифровка строки методом Виженера
# @param str [String] encrypted string|зашифрованная строка
# @param key [String] key word|ключевое слово
# @return [String] decrypted string|исходная строка
def viginere_decipher(str, key)
  decstr = ''
  key += key while key.size < str.size

  upper_rus = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
  lower_rus = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
  upper_eng = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  lower_eng = "abcdefghijklmnopqrstuvwxyz"

  (0..str.size - 1).each do |x|
    y = if upper_rus.include?(str[x])
          idx_key = if upper_rus.include?(key[x])
                      upper_rus.index(key[x])
                    elsif lower_rus.include?(key[x])
                      lower_rus.index(key[x])
                    elsif upper_eng.include?(key[x])
                      upper_eng.index(key[x])
                    elsif lower_eng.include?(key[x])
                      lower_eng.index(key[x])
                    else
                      0
                    end
          upper_rus[(upper_rus.index(str[x]) - idx_key) % 33]
        elsif lower_rus.include?(str[x])
          idx_key = if lower_rus.include?(key[x])
                      lower_rus.index(key[x])
                    elsif upper_rus.include?(key[x])
                      upper_rus.index(key[x])
                    elsif lower_eng.include?(key[x])
                      lower_eng.index(key[x])
                    elsif upper_eng.include?(key[x])
                      upper_eng.index(key[x])
                    else
                      0
                    end
          lower_rus[(lower_rus.index(str[x]) - idx_key) % 33]
        elsif str[x].ord in 65..90
          idx_key = if upper_eng.include?(key[x])
                      upper_eng.index(key[x])
                    elsif lower_eng.include?(key[x])
                      lower_eng.index(key[x])
                    elsif upper_rus.include?(key[x])
                      upper_rus.index(key[x])
                    elsif lower_rus.include?(key[x])
                      lower_rus.index(key[x])
                    else
                      0
                    end
          ((str[x].ord - 65 - idx_key) % 26 + 65).chr(Encoding::UTF_8)
        elsif str[x].ord in 97..122
          idx_key = if lower_eng.include?(key[x])
                      lower_eng.index(key[x])
                    elsif upper_eng.include?(key[x])
                      upper_eng.index(key[x])
                    elsif lower_rus.include?(key[x])
                      lower_rus.index(key[x])
                    elsif upper_rus.include?(key[x])
                      upper_rus.index(key[x])
                    else
                      0
                    end
          ((str[x].ord - 97 - idx_key) % 26 + 97).chr(Encoding::UTF_8)
        elsif str[x].ord in 48..57
          idx_key = if key[x].ord in 48..57
                      key[x].ord - 48
                    else
                      0
                    end
          ((str[x].ord - 48 - idx_key) % 10 + 48).chr(Encoding::UTF_8)
        else
          str[x]
        end
    decstr += y
  end
  decstr
end

# string encryption with Playfair cipher/Шифрование строки методом Плейфера
# @param str [String] input string|исходная строка
# @param key [Array<Array<String>>] square matrix as key|ключ в виде квадратной матрицы
# @return [String] encrypted string|зашифрованная строка
def playfair_cipher(str, key)
  upper_rus = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
  lower_rus = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
  upper_eng = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  lower_eng = "abcdefghijklmnopqrstuvwxyz"
  ch = ''
  if upper_rus.include? key[0][0]
    ch = 'Х'
  elsif lower_rus.include? key[0][0]
    ch = 'х'
  elsif upper_eng.include? key[0][0]
    ch = 'X'
  elsif lower_eng.include? key[0][0]
    ch = 'x'
  end
  ind = 0
  encstr = ''
  str = str.delete(' ')
  while ind < str.size
    x1 = -2
    y1 = -2
    x2 = -2
    y2 = -2
    (0..key.size - 1).each do |i|
      (0..key.size - 1).each do |j|
        if str[ind] == key[i][j]
          x1 = i
          y1 = j
        end
        if str[ind + 1] == key[i][j]
          x2 = i
          y2 = j
        end
      end
    end
    if x2 == -2 && y2 == -2 && x1 != -2 && y1 != -2
      str += ch
      redo
    end
    if x1 == x2 && y1 == y2
      str = "#{str[0..ind]}#{ch}#{str[ind + 1..]}"
      ind -= 2
    else
      encstr += if x1 != x2 && y1 != y2
                   key[x1][y2] + key[x2][y1]
                elsif x1 != x2 && y1 == y2
                   if x1 + 1 > key.size - 1
                     x1 = -1
                   end
                   if x2 + 1 > key.size - 1
                     x2 = -1
                   end
                   key[x1 + 1][y1] + key[x2 + 1][y2]
                else
                   if y1 + 1 > key[x1].size - 1
                     y1 = -1
                   end
                   if y2 + 1 > key[x2].size - 1
                     y2 = -1
                   end
                   key[x1][y1 + 1] + key[x2][y2 + 1]
                end
    end
    ind += 2
  end
  encstr
end

# string decryption with Playfair cipher|Расшифровка строки методом Плейфера
# @param str [String] encrypted string|зашифрованная строка
# @param key [Array<Array<String>>] square matrix as key|ключ в виде квадратной матрицы
# @return [String] decrypted string|исходная строка
def playfair_decipher(str, key)
  upper_rus = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
  lower_rus = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
  upper_eng = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  lower_eng = "abcdefghijklmnopqrstuvwxyz"
  ch = ''
  if upper_rus.include? key[0][0]
    ch = 'Х'
  elsif lower_rus.include? key[0][0]
    ch = 'х'
  elsif upper_eng.include? key[0][0]
    ch = 'X'
  elsif lower_eng.include? key[0][0]
    ch = 'x'
  end
  ind = 0
  encstr = ''
  str = str.delete(' ')
  while ind < str.size
    x1 = key.size + 1
    y1 = key.size + 1
    x2 = key.size + 1
    y2 = key.size + 1
    (0..key.size - 1).each do |i|
      (0..key.size - 1).each do |j|
        if str[ind] == key[i][j]
          x1 = i
          y1 = j
        end
        if str[ind + 1] == key[i][j]
          x2 = i
          y2 = j
        end
      end
    end
    encstr +=  if x1 != x2 && y1 != y2
   key[x1][y2] + key[x2][y1]
               elsif x1 != x2 && y1 == y2
              if x1 == 0
                x1 = 5
              end
              if x2 == 0
                x2 = 5
              end
              key[x1 - 1][y1] + key[x2 - 1][y2]
               else
              if y1 == 0
                y1 = 5
              end
              if y2 == 0
                y2 = 5
              end
              key[x1][y1 - 1] + key[x2][y2 - 1]
               end
    ind += 2
  end
  if encstr[-1] == ch
    encstr = encstr[0..-2]
  end
  x = 0
  while x < encstr.size - 3
    if encstr[x] == encstr[x+2] &&  encstr[x+1] == ch
      encstr = encstr[0..x] + encstr[x + 2..-1]
    end
    x+=1
  end
  encstr
end

# string encryption with Atbash cipher|шифрование строки шифром Атбаш
# @param str [String] input string|исходная строка
# @return [String] encrypted string|зашифрованная строка
def atbash_cipher(str)
  upper_rus = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
  lower_rus = "абвгдеёжзийклмнопрстуфхцчшщъыьэюя"
  upper_eng = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  lower_eng = "abcdefghijklmnopqrstuvwxyz"

  encstr = ""
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