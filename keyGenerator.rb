# Converts a string into an ascii number array
def convertToAsciiNumbers(string)
  i = 0
  numbers = {}

  (string.length).times do
      numbers[i] = string[i].ord
      i += 1
  end

  return numbers
end

# Generates a new encryption key
def generateKey(string)
  key = {}
  stringIterator = 0

  (string.length).times do
    charactersIterator = string[stringIterator] - 1
    divisorsIterator = 0
    divisors = {} # Possible divisors of the array's numbers

    # Check which numbers are possible divisors
    while charactersIterator > 0

      if string[stringIterator] % charactersIterator == 0
        divisors[divisorsIterator] = charactersIterator
        divisorsIterator += 1
      end
      charactersIterator -= 1
    end
    key[stringIterator] = divisors[rand(divisors.length)] # Choosing random divisor to be the primary key
    stringIterator += 1
  end

  return key
end

puts "The string you want to be encripted:\n"
inputString = convertToAsciiNumbers(gets.chomp.reverse)
puts "The encription key:\n"
secondaryKey = gets.chomp
primaryKey = generateKey(inputString)


puts inputString
puts primaryKey
