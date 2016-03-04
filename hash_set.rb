require_relative 'hash'
class HashSet

  attr_reader :size

  def initialize
    @set = Hashish.new
    @size = 0
  end

  def add(element)
    @set.set(element,1)
    @size += 1
  end

  def remove(element)
    @set.remove(element)
    @size -= 1
  end

  def contains?(element)
    return true if @set.get(element)
    false
  end

  def iterate(&block)
    @set.iterate {|key,_value| block.call(key)}
  end

end
