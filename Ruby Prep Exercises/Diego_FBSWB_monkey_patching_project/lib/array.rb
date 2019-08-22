# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
        inters = self.select{|value| value.is_a? Integer}
        1.0 * inters.sum / inters.size
  end

  def median
    return nil if self.empty?
    return self.sort[self.size/2] if self.size.odd?
    self.sort[self.size/2 -1 .. self.size/2].average
  end

  def counts
    counter = Hash.new(0)
    self.each {|element| counter[element] += 1}
    counter
  end

  def my_count(value)
    self.counts[value]
  end

  def my_index(value)
    self.each.with_index {|element, index| return index if element === value}
    nil
  end

  def my_uniq
    uniques = []
    self.each {|element| uniques << element if !uniques.include?(element)}
    uniques
  end

  def my_transpose
    new_array = Array.new(self.size) {Array.new(self.size)}
    self.each.with_index do |array, index1|
        array.each.with_index {|value, index2| new_array[index2][index1] = value}
    end
    new_array
  end
end