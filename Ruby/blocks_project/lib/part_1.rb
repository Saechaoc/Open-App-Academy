require "byebug"

def select_even_nums(array)
    array.select(&:even?)
end

def reject_puppies(array)
    array.reject {|dog| dog["age"] <= 2}
end

def count_positive_subarrays(array)
    array.count {|subArray| subArray.reduce(&:+) > 0}
end

def aba_translate(word)
    vowels = "aeiou"
    idx = 0

    while idx < word.length
        #debugger
        if vowels.include?(word[idx])
            word = word[0..idx] + "b" + word[idx..word.length]
            idx += 2
        end
        idx += 1
    end
    word
end


def aba_array(array)
    array.map{|word| aba_translate(word)}
end


