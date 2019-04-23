# require_relative './classes/items'
# require_relative './classes/list'

loop do 
    # Ask customer for input
        puts "Press (a)dd to add an item, or \nPress (p)review to view your current list, or \nPress (q)uit to exit once finished"
    answer = gets.strip.downcase

    case answer
    when "a"    # When input is (a)         
        puts "What item would you like to add to your shopping list?"
        item = gets.strip.downcase
        puts "How many #{item}'s would you like?"
        quantity = gets.strip.to_i
        customer_list = {}
        puts "You have "
    when "p"    # When input is (p)
        puts "Here are your current items that you've added:"
        # Add list
    when "q"    # When input is (q)
        puts "Here's your shopping list:"
        # Add list
        break
    else        # When input is none of the above
        puts "Invalid option"
    end
end