class List
    attr_accessor :item, :quantity
    def initialize(item, quantity)
        @item = item
        @quantity = quantity.to_i
        @list = Hash.new(0)
    end

    def add_item(item, quantity)
        @list[@item] += @quantity
        return self
    end

    def to_s
        return "#{@list}"
    end

    def preview
        return "Here is your shopping list #{@list}"
    end
end

puts "Add item"
@item = gets.strip
puts "Qty"
@quantity = gets.strip
ordered_list = List.new(@item, @quantity)
puts ordered_list.add_item(@item, @quantity).preview