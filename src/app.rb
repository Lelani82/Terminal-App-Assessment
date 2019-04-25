require_relative './classes/items'
require_relative './classes/list'
require 'tty-prompt'

# Creates new object
ordered_list = List.new

# Welcoming Message
puts "Welcome to your Shopping List App:"

# Main Loop - Prompts user to select an option (a) (p) (q) or else invalid
loop do
    puts "Press (a)dd to add an item, or \nPress (p)review to view your current list, or \nPress (q)uit to exit once finished"
    answer = gets.strip.downcase
    
    # Categories array
    categories = %w(fruit/veggies chilled/frozen meat/poultry bakery other)
        
    case answer
    # When input is (a) user can add an item
    when "a"
        puts "What item would you like to add to your shopping list?"
        item_name = gets.strip.downcase
        # Prompts user to select a category
        prompt = TTY::Prompt.new
        category = prompt.select('Choose your category', categories, help: '(Use arrow keys and Enter to finish)')
        item = Item.new(item_name, category)
        # Prompts user to add a quantity
        puts "How many #{item_name}'s would you like?"
        quantity = gets.strip.to_i
        ordered_list.add_item(item, quantity)
        # User taken back to main loop 
    # When input is (p) user can preview current list
    when "p"
        ordered_list.preview
    # When input is (q) user can quit adding items and view completed list
    when "q"
        ordered_list.print_final_list(categories)
        break
    else 
    # When user selects another option other than (a) (p) or (q), an invalid option is displayed
        puts "Invalid option"
    end
end