require_relative './classes/items'
require_relative './classes/list'
require 'tty-prompt'

# Creates new object
ordered_list = List.new

# Main Loop - Asks customer for options
loop do
    puts "Welcome to your Shopping List App:"
    puts "Press (a)dd to add an item, or \nPress (p)review to view your current list, or \nPress (q)uit to exit once finished"
    answer = gets.strip.downcase
    
    # Categories array
    categories = %w(fruit/veggies chilled/frozen meat/poultry bakery other)
        
    case answer
    # When input is (a)
    when "a"
        puts "What item would you like to add to your shopping list?"
        item_name = gets.strip.downcase
        prompt = TTY::Prompt.new
        category = prompt.select('Choose your category', categories, help: '(Use arrow keys and Enter to finish)')
        item = Item.new(item_name, category)
        puts "How many #{item_name}'s would you like?"
        quantity = gets.strip.to_i
        ordered_list.add_item(item, quantity)
    # When input is (p)
    when "p"
        ordered_list.preview
    # When input is (q)
    when "q"
        ordered_list.print_final_list(categories)
        break
    else 
        puts "Invalid option"
    end
end