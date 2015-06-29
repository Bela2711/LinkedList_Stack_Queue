#class node which defines each node in LinkedList with data and next node
class Node
    attr_accessor :value, :next_node

    def initialize(data,next_node_value)
        @value = data
        @next_node = next_node_value        
    end
end

#class LinkedList stores head, tail and length of a linked list as instance variables
#contains methods- add,remove,reverse operations
class LinkedList
  def initialize
    @head = nil    
    @tail = nil
    @length = 0
  end

  def add(value)
    if @head==nil
      @head = Node.new(value,nil)
      @tail = @head
    else
      current = @head
      while current.next_node != nil
         current = current.next_node
      end 
      current.next_node = Node.new(value,nil)
      @tail = current.next_node
    end
    @length = @length + 1
  end
 
  def remove(value_to_be_deleted)
    current = @head
        if current.value == value_to_be_deleted            
            @head = @head.next_node
            @length = @length-1
        else            
            while (current != nil) && (current.next_node != nil) && ((current.next_node).value != value_to_be_deleted)
                current = current.next_node
            end 
            if (current != nil) && (current.next_node != nil)
              #if we are removing the last node then the second node from the last should be the tail of the list
                if current.next_node.next_node == nil
                  @tail = current
                end
                current.next_node = (current.next_node).next_node                
                @length = @length-1
            end
        end        
  end
 
  def find(value_to_find)
    current = @head
    while (current != nil) && (current.next_node != nil) && ((current.next_node).value != value_to_find)
        current = current.next_node
    end 
    if (current != nil) && (current.next_node != nil)
      return current.next_node
    end
    return nil
  end

  def reverse
    current = @head
    previous_node = nil
    set_tail = 1
    while current
      if current.next_node==nil
        current.next_node = previous_node
        @head = current
        return
      end
      if set_tail == 1
        @tail = current
        set_tail = 0
      end
      temp_next_node = current.next_node
      current.next_node = previous_node
      previous_node = current
      current = temp_next_node      
    end
  end


  def head
    @head
  end 

  def tail
    @tail
  end
 
  def length
    @length
  end  
end