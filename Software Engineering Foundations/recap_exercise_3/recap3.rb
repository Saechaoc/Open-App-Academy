#simple testing method to determine if code matches intent
def assertEquals(actual, expected)
    if actual == expected
        puts "Successful"
    else
        puts "Code returns #{actual}, but expected #{expected}"
    end
end

=begin
    Write a method no_dupes?(arr) that accepts an array as an arg 
    and returns an new array containing the elements that were not repeated in the array.
=end
    
def no_dupes?(arr)
    arr.select {|ele| arr.count(ele) == 1}
end

# p no_dupes?([1,1,2,3]) #2
# p no_dupes?([1]) #1
# p no_dupes?([])

=begin
    Write a method no_consecutive_repeats?(arr) that accepts an array as an arg.
    The method should return true if an element never appears consecutively in the array; 
    it should return false otherwise.
=end
def no_consecutive_repeats?(arr)
    (0...arr.length-1).each do |idx|
        return false if arr[idx] == arr[idx+1]
    end
    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true


=begin 
    Write a method char_indices(str) that takes in a string as an arg. 
    The method should return a hash containing characters as keys. 
    The value associated with each key should be an array containing 
    The indices where that character is found.
=end

def char_indices(str)
    newHash = Hash.new()

    str.chars.each_with_index do |char,idx|
        if newHash.has_key?(char)
            newHash[char] << idx
        else
            newHash[char] = [idx]
        end
    end
    newHash
end

actual = char_indices('mississippi')   
expected = {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}

actual2 = char_indices('classroom')
expected2 = {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

puts "Testing char_indices:"

# assertEquals(actual,expected)
# assertEquals(actual2,expected2)

=begin
    Write a method longest_streak(str) that accepts a string as an arg. 
    The method should return the longest streak of consecutive characters 
    in the string. If there are any ties, return the streak that occurs later in the string.
=end
def longest_streak(str)
    return "" if str.nil? || str.empty?
    charArray = []
    max = 1
    count = 1

    (0...str.length).each do |idx|
        #If the current character == next character increase count 
        if str[idx] == str[idx+1]
            count += 1
        else
            count = 1
        end

        if (count >= max)
            max = count
            charArray[0] = str[idx]
            charArray[1] = max
        end
    end
    charArray[0] * charArray[1]
end

# lngResult1 = longest_streak(nil)           # => ""
# lngResult1 = longest_streak('a')           # => 'a'
# lngResult2 = longest_streak('accccbbb')    # => 'cccc'
# lngResult3 = longest_streak('aaaxyyyyyzz') # => 'yyyyy
# lngResult4 = longest_streak('aaabbb')      # => 'bbb'
# lngResult5 = longest_streak('abc')         # => 'c'

# assertEquals(lngResult1,'a')
# assertEquals(lngResult2,'cccc')
# assertEquals(lngResult3,'yyyyy')
# assertEquals(lngResult4,'bbb')
# assertEquals(lngResult5,'c')


=begin
    Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean 
    indicating whether or not the number is a bi-prime. A bi-prime is a positive integer,
    that can be obtained by multiplying two prime numbers.
=end
def bi_prime?(num)
    return true if num <= 3
    primes = primeHelper(num)

    primes.each do |val|
        primes.each do |val2|
            return true if val * val2 == num
        end
    end
    false
end

#generate a list of primes from 2 to n
def primeHelper(n)
    allNums = (2...n).to_a
    primes = allNums.each do |val|
        allNums.delete_if {|num| num % val == 0 && num != val}
    end
    primes
end

prime1 = bi_prime?(14)
biPrimeAns1 = true

prime2 = bi_prime?(22)
biPrimesAns2 = true

prime3 = bi_prime?(1)
biPrimeAns3 = true

# assertEquals(prime1,biPrimeAns1)
# assertEquals(prime2,biPrimesAns2)
# assertEquals(prime3,biPrimeAns3)

=begin
    Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args,
    returning the encrypted message. Assume that the message consists of only lowercase alphabetic characters.
=end
def vigenere_cipher(message, keys)
    alpha = ("a".."z").to_a
    chars = message.split('')
    keyIdx = 0
    
    chars.each_with_index do |originLetter,idx|
        newCharIdx = alpha.index(originLetter)
        p newCharIdx
        
        if !newCharIdx.nil?
            newCharIdx = (newCharIdx + keys[keyIdx]) % 26
            chars[idx] = alpha[newCharIdx]
            keyIdx += 1
        end

        if keyIdx >= keys.length
            keyIdx = 0
        end
    end

    chars.join('')
end

# assertEquals(vigenere_cipher("toerrishuman", [1]), "upfssjtivnbo")
# assertEquals(vigenere_cipher("toerrishuman", [1, 2]), "uqftsktjvobp")
# assertEquals(vigenere_cipher("toerrishuman", [1, 2, 3]), "uqhstltjxncq")
# assertEquals(vigenere_cipher("zebra", [3, 0]), "ceerd")
# assertEquals(vigenere_cipher("yawn", [5, 1]), "dbbo")

=begin
    Write a method vowel_rotate(str) that accepts a string as an arg and returns the string where every vowel 
    is replaced with the vowel the appears before it sequentially in the original string.
    The first vowel of the string should be replaced with the last vowel.
=end
def vowel_rotate(str)
    vowels = "aeiou"
    idxToSwap = [] #pairs of indexs to swap
    str = str.reverse()
    str.split('').each_with_index do |char,idx|
        #is this character a vowel?
        if vowels.include?(char)
            #add it to the index Swap array
            idxToSwap << idx
            #if the idxSwap array is full, swap elements and drop the first index
            if idxToSwap.length >= 2
                str[idxToSwap[0]], str[idxToSwap[1]] =  str[idxToSwap[1]], str[idxToSwap[0]]
                idxToSwap = idxToSwap.drop(1)
            end
        end
    end
    str.reverse()
end

# assertEquals(vowel_rotate('computer'),'cempotur')      # => "cempotur" #retupmoc -> #rutepmoc -> #rutopmec ->#cempotur
# assertEquals(vowel_rotate('oranges'), "erongas")
# assertEquals(vowel_rotate('headphones'), "heedphanos")
# assertEquals(vowel_rotate('bootcamp'), "baotcomp")
# assertEquals(vowel_rotate('awesome'), "ewasemo")

=begin
    Extend the string class by defining a String#select method that accepts a block. 
    The method should return a new string containing characters of the original string
    that return true when passed into the block. If no block is passed, then return the empty string. 
    Do not use the built-in Array#select in your solution.
=end

class String
    def select(&prc)
        prc ||= Proc.new {}
        wordArr = self.split('')
        newStr = []

        wordArr.each do |char|
            newStr << char if prc.call(char)
        end
        newStr.join('')
    end

    def map!(&prc)
        self.each_char.each_with_index do |char,idx|
            self[idx] = prc.call(char)
        end
        self
    end
end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

=begin
    Write a method multiply(a, b) that takes in two numbers and returns their product.
=end
def multiply(a,b)
    if(a == 0)
        return 0
    elsif(a < 0)
        return -b + multiply(a+1,b)
    else
        return b + multiply(a-1,b)
    end    
end

=begin
    Write a method lucas_sequence that accepts a number representing a length as an arg. 
    The method should return an array containing the Lucas Sequence up to the given length. 
    Solve this recursively.
=end
def lucas_sequence(length)
    return [] if length == 0
    return [2] if length == 1
    return [2,1] if length == 2
    seq = lucas_sequence(length-1) 
    next_el = seq[-1] + seq[-2]
    seq << next_el
    seq
end

p lucas_sequence(7)

=begin
    Write a method prime_factorization(num) that accepts a number and returns an array representing 
    the prime factorization of the given number. This means that the array should contain only 
    prime numbers that multiply together to the given num. The array returned should contain numbers 
    in ascending order. Do this recursively.
=end
def prime_factorization(num)
    
end