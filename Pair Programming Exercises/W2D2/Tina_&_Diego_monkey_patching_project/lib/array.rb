# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        self.empty? ? (nil) : self.sum / (self.length * 1.0)
    end

    def median
        return nil if self.empty?

        sorted = self.sort
        middle_element = sorted.length/2

        sorted.length.even? ? (sorted[middle_element-1] + sorted[middle_element])/2.0 : sorted[middle_element]
    end
  
    def counts
        counter = Hash.new(0)
        self.each {|ele| counter[ele] += 1}
        counter
    end

    def my_count(val)
        counter = 0
        self.each {|ele| counter += 1 if ele == val}
        counter
    end

    def my_index(val)
        return nil if !self.include?(val)
        self.each.with_index { |ele, idx| return idx if ele == val }
    end

    def my_uniq
        yes = []
        self.each {|ele| yes << ele if !yes.include?(ele) }
        yes
    end

    def my_transpose
        new = Array.new(self.length) {Array.new(self.length)}
        self.each_with_index do |array, idx1|
            array.each_with_index do |element, idx2|
                #new[idx2][idx1] = element
                new[idx2][idx1] = self[idx1][idx2]
            end
        end
        new
    end
end