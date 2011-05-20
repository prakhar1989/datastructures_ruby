require 'test/unit'
require 'queue'

class TestQueue < Test::Unit::TestCase
    def test_queue_as_array
        queue = Queue.new(3)
        assert queue.empty?
        assert !queue.full?
        
        assert_raise RuntimeError, "Queue Underflow - The queue is empty" do
            queue.dequeue
        end
        
        queue.enqueue(20)
        assert !queue.empty?
        assert !queue.full?
        assert_equal(1, queue.count)

        queue.enqueue(30)
        assert !queue.empty?
        assert !queue.full?
        assert_equal(2, queue.count)

        queue.enqueue(40)
        assert !queue.empty?
        assert queue.full?
        assert_equal(3, queue.count)

        queue.dequeue
        assert !queue.empty?
        assert !queue.full?
        assert_equal(2, queue.count)

        queue.dequeue
        queue.dequeue
        assert queue.empty?
        assert !queue.full?

    end
end
