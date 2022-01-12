module Enumerable

  def my_each
    if block_given?
      for elem in self
        yield elem
      end
      return self
    end
  end

  def my_each_with_index
    i = 0
    if block_given?
      for elem in self
        yield elem, i
        i += 1
      end
      return self
    end
  end

  def my_select
    output = self.is_a?(Hash) ? {} : []
    if block_given?
      self.my_each do |elem|
        if yield elem
          self.is_a?(Hash) ? output.store(elem[0], elem[1]) : output << elem
        end
      end
      return output
    end
  end

  def my_all?
    if block_given?

  end

  def my_any?

  end

  def my_none?

  end

  def my_count

  end

  def my_map

  end

  def my_inject

  end

end
