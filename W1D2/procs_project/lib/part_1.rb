def my_map(arr, &block)
  result = []
  arr.each { |ele| result << block.call(ele) }
  result
end

def my_select(arr, &block)
  result = []
  arr.each { |ele| result << ele if block.call(ele) }
  result
end

def my_count(arr, &block)
  count = 0
  arr.each { |ele| count += 1 if block.call(ele) }
  count
end

def my_any?(arr, &block)
  arr.each { |ele| return true if block.call(ele) }
  false
end

def my_all?(arr, &block)
  arr.each { |ele| return false if !block.call(ele) }
  true
end

def my_none?(arr, &block)
  arr.each { |ele| return false if block.call(ele) }
  true
end
