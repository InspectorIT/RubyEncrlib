# frozen_string_literal: true

def caesar_cipher(str, key)
  encstr = ''
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

def caesar_decipher(str, key)
  encstr = ''
  str.chars.each do |x|
    y = if x.ord in 1072..1103
          (((x.ord - 1072 - key) % 33) + 1072).chr(Encoding::UTF_8)
        elsif x.ord in 1040..1071
          (((x.ord - 1040 - key) % 33) + 1040).chr(Encoding::UTF_8)
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

def viginere_cipher(str, key)
  encstr = ''
  key += key while key.size < str.size
  (0..str.size - 1).each do |x|
    y = if str[x].ord in 1072..1103
          (((str[x].ord - 1072 + key[x].ord - 1072) % 33) + 1072).chr(Encoding::UTF_8)
        elsif str[x].ord in 1040..1071
          (((str[x].ord - 1040 + key[x].ord - 1040) % 33) + 1040).chr(Encoding::UTF_8)
        elsif str[x].ord in 65..90
          (((str[x].ord - 65 + key[x].ord - 65) % 26) + 65).chr(Encoding::UTF_8)
        elsif str[x].ord in 97..122
          (((str[x].ord - 97 + key[x].ord - 97) % 26) + 97).chr(Encoding::UTF_8)
        elsif str[x].ord in 48..57
          (((str[x].ord - 48 + key[x].ord - 48) % 10) + 48).chr(Encoding::UTF_8)
        else
          str[x]
        end
    encstr += y
  end
  encstr
end

def viginere_decipher(str, key)
  encstr = ''
  key += key while key.size < str.size
  (0..str.size - 1).each do |x|
    y = if str[x].ord in 1072..1103
          (((str[x].ord  - key[x].ord) % 33) + 1072).chr(Encoding::UTF_8)
        elsif str[x].ord in 1040..1071
          (((str[x].ord  - key[x].ord) % 33) + 1040).chr(Encoding::UTF_8)
        elsif str[x].ord in 65..90
          (((str[x].ord  - key[x].ord) % 26) + 65).chr(Encoding::UTF_8)
        elsif str[x].ord in 97..122
          (((str[x].ord  - key[x].ord) % 26) + 97).chr(Encoding::UTF_8)
        elsif str[x].ord in 48..57
          (((str[x].ord  - key[x].ord) % 10) + 48).chr(Encoding::UTF_8)
        else
          str[x]
        end
    encstr += y
  end
  encstr
end

def playfair_cipher(str, key)
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
      str += 'X'
      redo
    end
    if x1 == x2 && y1 == y2
      str = "#{str[0..ind]}X#{str[ind + 1..]}"
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

def playfair_decipher(str, key)
  ind = 0
  encstr = ''
  str = str.delete(' ')
  while ind < str.size
    x1 = 6
    y1 = 6
    x2 = 6
    y2 = 6
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
  if encstr[-1] == "X"
    encstr = encstr[0..-2]
  end
  x = 0
  while x < encstr.size - 3
    if encstr[x] == encstr[x+2] &&  encstr[x+1] == "X"
      encstr = encstr[0..x] + encstr[x + 2..-1]
    end
    x+=1
  end
    encstr
end
