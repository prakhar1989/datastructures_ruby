require 'test/unit'
require 'stack'

class TestStack < Test::Unit::TestCase
    def test_stack_as_array
        stack = Stack.new(2)

        assert stack.empty?
        assert !stack.singleton?
        assert !stack.full?

        assert_raise RuntimeError, "Stack Underflow - The stack is empty" do
            stack.pop
        end

        stack.push(20)
        stack.push(30)
        assert !stack.empty?
        assert stack.full?
        assert !stack.singleton?
        assert_equal(2, stack.length)

        assert_raise RuntimeError, "Stack Overflow - The stack is full" do
            stack.push(40)
        end

        assert_equal(30, stack.pop)
        assert stack.singleton?
        assert_equal(20, stack.pop)
        assert stack.empty?
        assert !stack.full?
        assert !stack.singleton?
        assert_equal(0, stack.length)

        #testing the stack reset
        #
        
        stack.reset
        assert stack.empty?
        assert !stack.full?
        assert !stack.singleton?
    end
end
