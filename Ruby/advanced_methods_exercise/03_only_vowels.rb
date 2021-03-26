# Write a method, `only_vowels?(str)`, that accepts a string as an arg.
# The method should return true if the string contains only vowels.
# The method should return false otherwise.


# def only_vowels?(str)
#     arr = str.split("")
#     vowels = "aeiou"

#     arr.each do |letter|
#         if (!vowels.include?(letter))
#             return false
#         end
#     end
#     true
#     #str.split.all?{|letter| letter == 'a' || letter == 'e' || letter == 'i' || letter == 'o' || letter == 'u'} 
# end


def only_vowels?(str)
    arr = str.split("")
    vowels = "aeiou"

    arr.all? {|char| vowels.include?(char)}

end

p only_vowels?("aaoeee")  # => true aaoeee
p only_vowels?("iou")     # => true
p only_vowels?("cat")     # => false
p only_vowels?("over")    # => false


