def hipsterfy(word)
    vowels = "aeiou"
    word = word.split('')
    (0...word.length-1).reverse_each do |i|
        if vowels.include?(word[i])
            word.delete_at(i)
            return word.join()
        end
    end
    word.join('')
end

#retuns a hash where each key is a vowel of the string and it's value is the number of times it appears
def vowel_counts(str)
    dict = {}
    vowels = "aeiou"
    str = str.downcase.split('')

    (0...str.length).each do |i|
        if vowels.include?(str[i])
            if dict.has_key?(str[i])
                dict[str[i]] += 1
            else
                dict[str[i]] = 1
            end
        end
    end
    
    dict
end


def caesar_cipher(msg, n)
    alphabet = "abcdefghijklmnopqrstuvwxyz".split('')

    (0...msg.length).each do |i| 
        char = msg[i]

        ct = -1 #Not found
        (0...alphabet.length).each do |j|
            if alphabet[j].eql?(char)
                ct = j
                break
            end
        end
        
        msg[i] = ct >= 0 ? alphabet[(ct + n)%26]:msg[i]  
    end

    msg
end


p caesar_cipher("apple", 1)