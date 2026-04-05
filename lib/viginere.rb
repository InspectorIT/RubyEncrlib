def viginere_symbol_key_search(sym, key)
  upper_rus = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'
  lower_rus = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя'
  upper_eng = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  lower_eng = 'abcdefghijklmnopqrstuvwxyz'
  if upper_rus.include?(key[sym])
    upper_rus.index(key[sym])
  elsif lower_rus.include?(key[sym])
    lower_rus.index(key[sym])
  elsif upper_eng.include?(key[sym])
    upper_eng.index(key[sym])
  elsif lower_eng.include?(key[sym])
    lower_eng.index(key[sym])
  else
    0
  end
end

def viginere_symbol_search(sym, str, key)
  upper_rus = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'
  lower_rus = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя'
  if upper_rus.include?(str[sym])
    upper_rus[(upper_rus.index(str[sym]) + viginere_symbol_key_search(sym, key)) % 33]
  elsif lower_rus.include?(str[sym])
    lower_rus[(lower_rus.index(str[sym]) + viginere_symbol_key_search(sym, key)) % 33]
  elsif str[sym].ord in 65..90
    (((str[sym].ord - 65 + viginere_symbol_key_search(sym, key)) % 26) + 65).chr(Encoding::UTF_8)
  elsif str[sym].ord in 97..122
    (((str[sym].ord - 97 + viginere_symbol_key_search(sym, key)) % 26) + 97).chr(Encoding::UTF_8)
  elsif str[sym].ord in 48..57
    idx_key = if key[sym].ord in 48..57
                key[sym].ord - 48
              else
                0
              end
    (((str[sym].ord - 48 + idx_key) % 10) + 48).chr(Encoding::UTF_8)
  else
    str[sym]
  end
end

# string encryption with Viginere cipher/Шифрование строки методом Виженера
# @param str [String] input string|исходная строка
# @param key [String] key word|ключевое слово
# @return [String] encrypted string|зашифрованная строка
def viginere_cipher(str, key)
  encstr = ''
  key += key while key.size < str.size
  (0..(str.size - 1)).each do |x|
    y = viginere_symbol_search(x, str, key)
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
  upper_rus = 'АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ'
  lower_rus = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя'
  (0..(str.size - 1)).each do |x|
    y = if upper_rus.include?(str[x])
          upper_rus[(upper_rus.index(str[x]) - viginere_symbol_key_search(x, key)) % 33]
        elsif lower_rus.include?(str[x])
          lower_rus[(lower_rus.index(str[x]) - viginere_symbol_key_search(x, key)) % 33]
        elsif str[x].ord in 65..90
          (((str[x].ord - 65 - viginere_symbol_key_search(x, key)) % 26) + 65).chr(Encoding::UTF_8)
        elsif str[x].ord in 97..122
          (((str[x].ord - 97 - viginere_symbol_key_search(x, key)) % 26) + 97).chr(Encoding::UTF_8)
        elsif str[x].ord in 48..57
          idx_key = if key[x].ord in 48..57
                      key[x].ord - 48
                    else
                      0
                    end
          (((str[x].ord - 48 - idx_key) % 10) + 48).chr(Encoding::UTF_8)
        else
          str[x]
        end
    decstr += y
  end
  decstr
end
