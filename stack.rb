class Stack

    def initialize(max_size = 1)
        @length = max_size
        self.reset
    end
    
    def reset
        @array = Array.new(@length)
        @top = nil
    end

    def empty?
        @top == nil
    end

    def full?
        @top == @length - 1
    end

    def singleton?
        @top == 0
    end

    def length
        return 0 if @top == nil
        @top + 1
    end

    def push(x)
        raise RuntimeError, "Stack Overflow - The stack is full" if full?
        if empty?
            @top = 0
        else
            @top += 1
        end
        @array[@top] = x
    end

    def pop
        raise RuntimeError,"Stack Underflow - The stack is empty"  if empty?
        popped_val = @array[@top]
        @array[@top] = nil
        if @top == 0
            @top = nil
        else
            @top -= 1
        end
        popped_val
    end
end
