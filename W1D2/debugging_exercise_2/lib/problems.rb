# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(n)
  n.downto(2) { |i| return i if n % i == 0 && prime?(i) }
end

def prime?(num)
  return false if num < 2

  (2...num).each do |factor|
    if num % factor == 0
      return false
    end
  end

  true
end

def unique_chars?(string)
  list = all_chars(string)
  string.each_char { |char| return false if list[char] >= 2 }
  true
end

def all_chars(string)
  chars = {}
  string.each_char do |char|
    if !chars[char]
      chars[char] = 1
    else
      chars[char] += 1
    end
  end

  chars
end

def dupe_indices(array)
  hash = Hash.new { |h, k| h[k] = [] }
  array.each_with_index { |ele, i| hash[ele] << i }
  hash.select { |k, v| v.length >= 2 }
end

def ana_array(arr_1, arr_2)
  elements_in_array(arr_1) == elements_in_array(arr_2)
end

def elements_in_array(arr)
  elements = {}
  arr.each do |ele|
    if !elements[ele]
      elements[ele] = 1
    else
      elements[ele] += 1
    end
  end

  elements
end
