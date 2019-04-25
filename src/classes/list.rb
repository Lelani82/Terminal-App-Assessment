require_relative 'items'
require 'tty-prompt'

class List
    attr_reader :item, :quantity
    def initialize
        # @list is a hash where the item is the key, and the quantity is the value
        @list = Hash.new(0)
    end

    def add_item(item, quantity)
        @list[item] += quantity
        return self
    end

    def preview
        # This creates current shopping items list
        puts "Your current shopping list is:"
        puts "-------------------------------"
        @list.each do |item, quantity|
            puts "#{quantity} - #{item.item_name}"
        end
        puts "________________________________"
    end

    def print_category(category)
        #print items and quantities in category
        puts category
        puts
        puts 
        #print items
        @list.each do |item, quantity|
            if(item.category == category)
                puts "#{ quantity} - #{item.item_name}"
            end
        end        
        puts "____________________________"
        puts
    end

    def print_final_list(categories)
        # This creates the final shopping list in categories
        puts "Your Final Shopping List:"
        puts "-------------------------------"
        categories.each do |category|
            print_category(category)
        end
    end

end