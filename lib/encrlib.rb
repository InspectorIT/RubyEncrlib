# frozen_string_literal: true

def caesar_cypher(str, key)
  encstr = ""
  str.chars.each do |x|
    y = if x.ord in 1072..1103
          (((x.ord - 1072 + key) % 33) + 1072).chr(Encoding::UTF_8)
        elsif x.ord in 1040..1071
          (((x.ord - 1040 + key) % 33) + 1040).chr(Encoding::UTF_8)
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
