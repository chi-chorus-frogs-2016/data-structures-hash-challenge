require_relative 'hash'
class HashSet
  def initialize
    @set = Hashish.new
  end

  def add(element)
    @set.set(element,1)
  end

  def remove(element)
    @set.remove(element)
  end

  def contains?(element)
    return true if @set.get(element)
    false
  end

  def iterate(&block)
    @set.iterate {|key,value| block.call(key)}
  end

  def size
    acc = 0
    self.iterate { |v| acc += 1 if v }
    acc
  end
end
