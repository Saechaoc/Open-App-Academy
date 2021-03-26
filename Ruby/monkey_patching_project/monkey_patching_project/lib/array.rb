# Monkey-Patch Ruby's existing Array class to add your own custom methods
require 'byebug'

class Array
    def span
        return nil if self.empty?
        min = self[0]
        max = self[0]

        self.each do |val|
            if val > max
                max = val
            elsif val < min
                min = val
            end
        end

        return max - min
    end

    def average
        return nil if self.empty?
        return self.inject(:+)/self.count.to_f
    end

    def median
        return nil if self.empty?
        self.sort!
        count = self.count/2
        self.count % 2 == 0 ? (return (self[count] + self[count-1])/2.0):(return self[count])
    end

    def counts
        val = {}
        self.sort!

        count = 1
        (0...self.count).each do |idx|
            if (idx != self.count - 1) && self[idx+1].casecmp?(self[idx])
                 count+=1
            else
                val[self[idx]] = count
                count = 1
            end
        end
        return val
    end

    def my_count(value)
        count = 0
        self.each{|ele| count += 1 if ele.casecmp?(value)}
        count
    end

    def my_index(value)
        self.each_with_index{|ele,idx| return idx if ele.casecmp?(value)}
        return nil
    end

    def my_uniq
        newArr = []
        self.each do |value|
            newArr << value if !newArr.include?(value)
        end
        newArr
    end

    def my_transpose()
        rows = self.count
        cols = self[0].count

        newArr = Array.new(cols) {Array.new(rows)}
        (0...rows).each do |i|
            (0...cols).each do |j|
                newArr[j][i] = self[i][j]    
            end
        end
        newArr
    end
end
