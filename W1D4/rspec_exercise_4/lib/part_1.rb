def my_reject(array, &block)
  array.select { |ele| !block.call(ele) }
end

def my_one?(array, &block)
  return true if array.count { |ele| block.call(ele) } == 1
  false
end

def hash_select(hash, &block)
  new_hash = {}
  hash.each do |k, v|
    if block.call(k, v)
      new_hash[k] = v
    end
  end
  new_hash
end

def xor_select(array, proc_1, proc_2)
  array.select { |ele| (proc_1.call(ele) || proc_2.call(ele)) && !(proc_1.call(ele) && proc_2.call(ele)) }
end

def proc_count(val, procs)
  procs.count { |proc| proc.call(val) }
end
