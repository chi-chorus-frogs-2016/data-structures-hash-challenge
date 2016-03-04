class Hashish
  def initialize
    @hash = []
    20.times { |i| @hash.push([]) }
  end

  def hash_function(str)
    hash = 7
    str.each_char { |chr| hash = (hash * 31) % str.length + chr.ord }
    hash
  end

  def set_bucket(key)
    hash_function(key) % 20
  end

  def get_bucket(key)
    @hash[hash_function(key) % 20]
  end

  def set(key, value)
    bucket_id = set_bucket(key)
    @hash[bucket_id][hash_function(key)] = value
    value
  end

  def get(key)
    hashed_key = hash_function(key)
    return get_bucket(key)[hashed_key]
  end

  def has_key?(key)
    hashed_key = hash_function(key)
    return true unless get_bucket(key)[hashed_key].nil?
    false
  end

  def remove(key)
    hashed_key = hash_function(key)
    get_bucket(key)[hashed_key] = nil if get_bucket(key)[hashed_key]
    key
  end

  def iterate(&block)
    
  end

end
