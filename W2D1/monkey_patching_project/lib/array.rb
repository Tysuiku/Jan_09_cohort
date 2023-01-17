# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length <= 0
    self.max - self.min
  end

  def average
    return nil if self.length <= 0
    self.sum / (self.length * 1.0)
  end

  def median
    return nil if self.length <= 0
    mid_idx = self.length / 2
    sorted = self.sort

    if self.length.odd?
      return sorted[mid_idx]
    else
      return (sorted[mid_idx - 1] + sorted[mid_idx]) / 2.0
    end
  end

  def counts
    hash = {}
    self.each do |ele|
      if !hash[ele]
        hash[ele] = 1
      else
        hash[ele] += 1
      end
    end
    hash
  end

  def my_count(value)
    count = 0
    self.each { |ele| count += 1 if ele == value }
    count
  end

  def my_index(value)
    (0...self.length).each do |i|
      if self[i] == value
        return i
      end
    end

    nil
  end

  def my_uniq
    result = []
    self.each do |ele|
      if !result.include? ele
        result << ele
      end
    end

    result
  end

  def my_transpose
    arr = Array.new(self.length) { [] }

    self.each_with_index do |ele, i|
      self.each_with_index do |ele, j|
        arr[i] << self[j][i]
      end
    end

    arr
  end
end
