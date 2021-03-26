def average(num1, num2)
    (num1 + num2)/2.0
end

def average_array(array)
    avg = 0
    ct = 0

    array.each do |el|
        avg += el
        ct += 1.0
    end

    avg/ct
end

def repeat(st, numTimes)
    st * numTimes
end

def yell(str)
    str.upcase + "!"
end


def alternating_case(sentence)
    arr = sentence.downcase.split()
    (0...arr.length-1).each do |i|
        if i % 2 == 0 
            arr[i] = arr[i].upcase()
        end
    end
    arr.join(" ")
end

