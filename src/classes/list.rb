require_relative 'items'
require 'tty-prompt'

class List
    attr_reader :item, :quantity
    def initialize
        # @list is a hash where the item is the key, and the quantity is the value
        @list = Hash.new(0)
    end

        # Adds item and quantity to @list
    def add_item(item, quantity)
        @list[item] += quantity
        return self
    end

    # This creates current shopping list for user to preview
    def preview
        puts "Your current shopping list is:"
        puts "-------------------------------"
        @list.each do |item, quantity|
            puts "#{quantity} - #{item.item_name}"
        end
        puts "________________________________"
    end

    def print_category(category)
        # Prints items and quantities in category
        puts category
        puts
        puts 
        # Print items
        @list.each do |item, quantity|
            if(item.category == category)
                puts "#{ quantity} - #{item.item_name}"
            end
        end        
        puts "____________________________"
        puts
    end

    # This creates final shopping list sorted into categories
    def print_final_list(categories)
        puts "Your Final Shopping List:"
        puts "-------------------------------"
        categories.each do |category|
            print_category(category)
        end
    end

end