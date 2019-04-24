require_relative 'items'
require 'tty-prompt'

class List
    
    def initialize
        # @list is a hash where the item is the key, and the quantity is the value
        @list = Hash.new(0)
    end

    def add_item(item, quantity)
        @list[item] += quantity
        return self
    end

    def preview                                                 # This creates current shopping items list
        puts "=============================="
        puts "Your current shopping list is:"
        puts "=============================="
        @list.each do |item, quantity|
            puts "#{quantity} - #{item.item_name}"              
        end
        puts "=============================="
    end

    def final                                                   # This creates the final shopping list in categories
        puts "=============================="
        puts "Your current shopping list is:"
        puts "=============================="
        @list.each do |item, quantity|
            puts "#{quantity} - #{item.item_name}"              
        end
        puts "=============================="
    end

end

# Creates new object
ordered_list = List.new

# Main Loop - Asks customer for options
loop do 
    puts "Press (a)dd to add an item, or \nPress (p)review to view your current list, or \nPress (q)uit to exit once finished"
    answer = gets.strip.downcase
    case answer
    when "a"                                            # When input is (a)
        puts "What item would you like to add to your shopping list?"
        item_name = gets.strip.downcase
        prompt = TTY::Prompt.new
        category = %w(fruit/veggies chilled/frozen meat/poultry bakery other)
        prompt.multi_select('Choose your favourite drink?', category, help: '(Use arrow keys and Enter to finish)')
        item = Item.new(item_name, category)
        puts "How many #{item_name}'s would you like?"
        quantity = gets.strip.to_i
        ordered_list.add_item(item, quantity)
    when "p"                                            # When input is (p)
        puts ordered_list.preview
    when "q"                                            # When input is (q)
        puts "Here's your shopping list:"
        puts ordered_list
        break
    else                                                # When input is none of the above
        puts "Invalid option"
    end
end