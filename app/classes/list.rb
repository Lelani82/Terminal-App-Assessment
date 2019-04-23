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

# puts "Add item"
# @item = gets.strip
# puts "Qty"
# @quantity = gets.strip

#puts ordered_list.add_item(@item, @quantity).preview

loop do 
    # Ask customer for input
        puts "Press (a)dd to add an item, or \nPress (p)review to view your current list, or \nPress (q)uit to exit once finished"
    answer = gets.strip.downcase

    case answer
    when "a"    # When input is (a)         
        puts "What item would you like to add to your shopping list?"
        @item = gets.strip.downcase
        puts "How many #{@item}'s would you like?"
        @quantity = gets.strip.to_i
    when "p"    # When input is (p)
        ordered_list = List.new(@item, @quantity)
        puts ordered_list.add_item(@item, @quantity).preview
    when "q"    # When input is (q)
        puts "Here's your shopping list:"
        ordered_list = List.new(@item, @quantity)
        puts ordered_list.add_item(@item, @quantity).preview
        break
    else        # When input is none of the above
        puts "Invalid option"
    end
end
