require_relative 'channel.rb'

def intro
    puts "Welcome to the Youtube Channel CLI information search! Please select from the following options!"
    puts "Type '1' to search by channel or type '2' to close the application"
    user_input = gets.strip
        while user_input != '1' && user_input != '2'
            puts "That was not a valid entry. Please Type '1' to search by channel or type '2' to close the application"
            user_input = gets.strip
        end
        if user_input == '1'
            enter_channel_name
        elsif user_input == '2'
            close
        end        
end

def enter_channel_name
    puts "Please enter the name of a channel that you would like to learn more about."
    user_input = gets.strip
    channel = Channel.new(user_input)
    print(channel.name)
    print(channel.id)
    print(channel.view_count)
    print(channel.date_created)
    print(channel.description)
        #if user_input == true
            #channel_options
            #should I make a method about checking if the input is true separate of this then call the method?
        #else
            #puts "I'm sorry. I could not find that channel. Please enter a channel or type close to leave the application"
                #if !close 
                    #enter_channel_name
                #else 
                    #close
                #end
        #end
end

def close
    puts "Thank you for trying the Youtube Channel CLI information search!"
    exit(true)
end 

intro()