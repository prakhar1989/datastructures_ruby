require 'node'

class SinglyLinkedList

    def initialize
        @head = Node.new(self, nil)
        self.reset
    end

    def head
        @head.next
    end

    def empty?
        @head.next == nil
    end

    def pop
        raise RuntimeError, "List Underflow Error - The list is empty" if empty?
        popped_node, previous_node = goto_last
        previous_node.next = nil
        @count -= 1
        if (@count == 0)
            @head.next = nil
        end
        popped_node.key
    end

    def push(x)
        node = Node.new(self, x)
        if @head.next == @head #first node to be added
            @head.next = node
        else
            last_node,useless_node = goto_last
            last_node.next = node
        end
        @count += 1
    end

    def count
        @count
    end
    
    def search(x)

        raise RuntimeError, "List is empty." if empty?
        position = 0
        temp = Node.new(self, nil)
        temp.next = @head.next
        while(temp.next != nil && temp.next.key != x)
            temp.next = temp.next.next
            position += 1
        end
        if (temp.next != nil && temp.next.key == x)
            position+1
        else 
            false
        end
    end
    
    def goto_last
        temp = Node.new(self, nil)
        temp.next = @head
        while(temp.next.next != nil)
            prev = temp.next
            temp.next = temp.next.next
        end
        [temp.next, prev]
    end

    def reset
        @head.next = nil
        @count = 0
    end
end
