class Hashish
  def initialize
    @hash = []
  end

  def hash_function(str)
    hash = 7
    str.each_char { |chr| hash = (hash * 31) % str.length + chr.ord }
    hash
  end

  def set(key, value)
    hashed_key = hash_function(key)
    @hash[hashed_key] = value
    value
  end

  def get(key)
    hashed_key = hash_function(key)
    return @hash[hashed_key]
  end

  def has_key?(key)
    hashed_key = hash_function(key)
    return true unless @hash[hashed_key].nil?
    false
  end

  def remove(key)
    hashed_key = hash_function(key)
    @hash[hashed_key] = nil if @hash[hashed_key]
    key
  end

  
end
