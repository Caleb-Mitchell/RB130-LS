=begin
The following list contains the names of individuals who are pioneers in the
field of computing or that have had a significant influence on the field. The
names are in an encrypted form, though, using a simple (and incredibly weak)
form of encryption called Rot13.

input: a string, that i need to split by new line
output: a list of the translated names

mm:
for each letter in each name:
  if it is in lowercase alphabet
    replace the character with letter 13 char after it
  else
    add a space
  end
end

algo:
for each char in each name:
  init upper flag to false
  if it is uppercase, set upper flag to true, and downcase

  iterate over alphabet:
    if letter matches:
      replace with char 13 indices later in alpha array
      if upper flag is true, uppercase
      return the letter
    end
    
    return a space
=end

NAMES = 'Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu'

ALPHA = ('a'..'z').to_a

def decipher_char(char, upper)
  ALPHA.each_with_index do |letter, idx|
    if letter == char && upper == true
      return char = ALPHA[((idx + 13) % 26)].upcase
    elsif letter == char && upper == false
      return char = ALPHA[((idx + 13) % 26)]
    elsif char == " "
      char = " "
    end
  end
  char
end

def decipher_rot_13
  names = NAMES.split("\n")
  names.map! do |name|
    chars = name.chars
    chars.map! do |char|
      upper = false
      upper = true if char.match?(/[A-Z]/)
      decipher_char(char.downcase, upper)
    end
    chars.join
  end
end

p decipher_rot_13
