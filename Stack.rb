class Stack
  def initialize(size)
    @store = Array.new(size)
    @top=-1
  end
  
  def pop
    if empty?
      return nil
    end    
    popped = @store[@top]
    @store[@top] = nil
    @top = @top-1
    return popped
  end
  
  def push(element)
    if full?
      return nil
    end
    if element == nil
      return nil
    end
    @top = @top+1
    @store[@top]=element
    return self
  end
  
  def size
    @store.size
  end
  
  def look
    @store[@top]
  end
  
  private
  
  def full?
    @store.size == (@top+1)
  end
  
  def empty?
    @top == -1
  end
end