def element_count(array)
  hash = {}
  array.each do |ele|
    if !hash[ele]
      hash[ele] = 1
    else
      hash[ele] += 1
    end
  end
  hash
end

def char_replace!(string, hash)
  string.each_char.with_index { |char, i| string[i] = hash[char] if hash[char] }
  string
end

def product_inject(nums)
  nums.inject { |acc, el| acc * el }
end
