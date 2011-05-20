require 'test/unit'
require 'singly_linked_list'

class TestSinglyLinkedList < Test::Unit::TestCase
    def test_singly_linked_list
        my_list = SinglyLinkedList.new

        assert my_list.empty?
        assert_equal(0, my_list.count)

        assert_raise RuntimeError, "List underflow error - List is empty" do
            my_list.pop
        end

        my_list.push(10)
        my_list.push(20)
        my_list.push(30)

        assert !my_list.empty?
        assert_equal(3, my_list.count)

        assert_equal(1, my_list.search(10))
        assert_equal(2, my_list.search(20))
        assert_equal(3, my_list.search(30))
        assert_equal(false, my_list.search(23))

        assert_equal(30,my_list.pop)
        assert_equal(20, my_list.pop)
        assert_equal(10, my_list.pop)
        assert my_list.empty?
        assert_raise RuntimeError, "List is empty" do
            my_list.search(23)
        end

        new_list = SinglyLinkedList.new
        assert new_list.empty?

        assert_raise RuntimeError, "List underflow error - List is empty" do 
            new_list.pop
        end

        new_list.push(50)
        assert_equal(1, new_list.count)
        assert !new_list.empty?
        assert_equal(50, new_list.pop)
        assert new_list.empty?
    end
end
