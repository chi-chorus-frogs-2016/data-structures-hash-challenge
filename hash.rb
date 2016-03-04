class Hashish
  def initialize
    @hash = []
    20.times { |i| @hash.push([]) }
  end

  def hash_function(str)
    hash = 7
    str.each_char { |chr| hash = (hash * 31) + chr.ord }
    hash
  end

  def set_bucket(key)
    hash_function(key.to_s) % 20
  end

  def get_bucket(key)
    @hash[hash_function(key.to_s) % 20]
  end

  def set(key, value)
    bucket_id = set_bucket(key)
    @hash[bucket_id] = [key,value]
    value
  end

  def get(key)
    return nil if get_bucket(key).nil?
    get_bucket(key)[1]
  end

  def has_key?(key)
    return true unless get_bucket(key).empty?
    false
  end

  def remove(key)
    @hash[set_bucket(key)] = nil
    key
  end

  def iterate(&block)
    @hash.each do |bucket|
      block.call(bucket[0],bucket[1])
    end
  end
end
