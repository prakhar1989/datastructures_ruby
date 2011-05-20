class Queue

    def initialize(max_size = 1)
        @length = max_size
        self.reset
    end

    def empty?
        @front == nil
    end
    
    def full?
        @front == @rear
    end

    def count
        @count
    end

    def peek
        @front
    end

    def reset
        @array = Array.new(@length)
        @front = nil
        @rear = 0
        @count = 0
    end

    def dequeue
        raise RuntimeError, "Queue Underflow - The queue is empty" if empty?
        
        x = @array[@front]
        if (@front + 1 == @length)
            @front = 0
        else
            @front += 1
        end
        @count -= 1
        if @front==@rear
            self.reset
        end
    end

    def enqueue(x)
        raise RuntimeError, "Queue Overflow - The queue is full" if full?

        @front = 0 if @front.nil?
        @array[@rear] = x
        if (@rear + 1 == @length)
            @rear = 0
        else
            @rear += 1
        end
        @count += 1
    end
end

