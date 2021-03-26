# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    biggerNum = num_1
    fixed = num_1
    smallerNum = num_2

    if num_1 < num_2
        biggerNum = num_2
        smallerNum = num_1
        fixed = num_2
    end

    while biggerNum % smallerNum != 0
        biggerNum += fixed
    end
    biggerNum
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    #create hash key = bigram, value = occurrences
    #return key with highest value
    biHash = {}

    (0...str.length-1).each do |char|
        #check if the hash contains the char
        #if the hash does not contain the char add it
        #if exists increment value ++
        letter = str[char] + str[char+1]
        if biHash.has_key?(letter)
            biHash[letter] += 1
        else
            biHash[letter] = 1
        end
    end

    #return key of highest value
    biHash.key(biHash.values.max)
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        self.map{|k,v| [v,k]}.to_h
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    #assuming can't add itself
    def pair_sum_count(num)
        count = 0

        (0...self.length-1).each do |i|
            (i+1...self.length).each do |j|
                if num == (self[i] + self[j])
                    count+=1
                end
            end
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        return self if self.length <= 1
        prc ||= Proc.new {|a,b| a <=> b}
        sorted = false

        while !sorted
            sorted = true
            #loop thru elements and swap pairs if we don't swap any then it's sorted
            (0...self.length-1).each do |idx|
                if prc.call(self[idx], self[idx+1]) == 1
                    self[idx], self[idx+1] = self[idx+1], self[idx]
                    sorted = false
                end
            end
        end

        self
    end
end
