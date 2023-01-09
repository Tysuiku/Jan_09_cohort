def reverser(str, &block)
  block.call(str.reverse)
end

def word_changer(sentence, &block)
  sentence.split(" ").map { |ele| block.call(ele) }.join(" ")
end

def greater_proc_value(num, prc_1, prc_2)
  return prc_1.call(num) if prc_1.call(num) > prc_2.call(num)
  prc_2.call(num)
end

def and_selector(arr, prc_1, prc_2)
  arr.select { |ele| prc_1.call(ele) && prc_2.call(ele) }
end

def alternating_mapper(arr, prc_1, prc_2)
  arr.map.with_index do |ele, i|
    if i % 2 == 0
      prc_1.call(ele)
    else
      prc_2.call(ele)
    end
  end
end
