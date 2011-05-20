class Node
    attr_accessor :key
    attr_accessor :next

    def initialize(list, key)
        @key = key
        @list = list
    end
end
