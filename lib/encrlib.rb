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