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
    @user_input = gets.strip
    @channel = Channel.new(@user_input)
        #if channel == true
        
            channel_options
        #else
            #puts "I'm sorry. I could not find that channel. Please enter a channel or type close to leave the application"
                #if !close 
                    #enter_channel_name
                #else 
                    #close
                #end
        #end
end

def channel_options
    puts "Type '1' to see the total view count for #{@user_input}."
    puts "Type '2' to see the date that #{@user_input} was created."
    puts "Type '3' to see the channel description for #{@user_input}."
    puts "Type '4' to see the number of videos that #{@user_input} has posted."
    puts "Type '5' to see the the total subscriber count for #{@user_input}."
    user_input = gets.strip
    while user_input != '1' && user_input != '2' && user_input != '3' && user_input != '4' && user_input != '5'
        puts "That was not a valid entry. Please select from the following:"
        puts "Type '1' to see the total view count for #{@user_input}."
        puts "Type '2' to see the date that #{@user_input} was created."
        puts "Type '3' to see the channel description for #{@user_input}."
        puts "Type '4' to see the number of videos that #{@user_input} has posted."
        puts "Type '5' to see the the total subscriber count for #{@user_input}."
        user_input = gets.strip
    end
    if user_input == '1'
        view_count
    elsif user_input == '2'
        date_created
    elsif user_input == '3'
        description
    elsif user_input == '4'
        video_count
    elsif user_input == '5'
        subscriber_count
    end
end

def view_count
    puts "#{(@channel.view_count)}"
    puts "Please type '1' to return to the option menu,'2' to input a new channel search, or '3' to close."
    user_input = gets.strip
    while user_input != '1' && user_input != '2' && user_input != '3'
        puts "That was not a valid entry."
        puts "Please type '1' to return to the option menu,'2' to input a new channel search, or '3' to close."
        user_input = gets.strip
    end
    if user_input == '1'
        channel_options
    elsif user_input == '2'
        enter_channel_name
    elsif user_input == '3'
        close
    end
end

def date_created
    puts "#{(@channel.date_created)}"
    puts "Please type '1' to return to the option menu,'2' to input a new channel search, or '3' to close."
    user_input = gets.strip
    while user_input != '1' && user_input != '2' && user_input != '3'
        puts "That was not a valid entry."
        puts "Please type '1' to return to the option menu,'2' to input a new channel search, or '3' to close."
        user_input = gets.strip
    end
    if user_input == '1'
        channel_options
    elsif user_input == '2'
        enter_channel_name
    elsif user_input == '3'
        close
    end
end

def description 
    puts "#{(@channel.description)}"
    puts "Please type '1' to return to the option menu,'2' to input a new channel search, or '3' to close."
    user_input = gets.strip
    while user_input != '1' && user_input != '2' && user_input != '3'
        puts "That was not a valid entry."
        puts "Please type '1' to return to the option menu,'2' to input a new channel search, or '3' to close."
        user_input = gets.strip
    end
    if user_input == '1'
        channel_options
    elsif user_input == '2'
        enter_channel_name
    elsif user_input == '3'
        close
    end
end

def video_count
    puts "#{(@channel.video_count)}"
    puts "Please type '1' to return to the option menu,'2' to input a new channel search, or '3' to close."
    user_input = gets.strip
    while user_input != '1' && user_input != '2' && user_input != '3'
        puts "That was not a valid entry."
        puts "Please type '1' to return to the option menu,'2' to input a new channel search, or '3' to close."
        user_input = gets.strip
    end
    if user_input == '1'
        channel_options
    elsif user_input == '2'
        enter_channel_name
    elsif user_input == '3'
        close
    end
end

def subscriber_count
    puts "#{(@channel.subscriber_count)}"
    puts "Please type '1' to return to the option menu,'2' to input a new channel search, or '3' to close."
    user_input = gets.strip
    while user_input != '1' && user_input != '2' && user_input != '3'
        puts "That was not a valid entry."
        puts "Please type '1' to return to the option menu,'2' to input a new channel search, or '3' to close."
        user_input = gets.strip
    end
    if user_input == '1'
        channel_options
    elsif user_input == '2'
        enter_channel_name
    elsif user_input == '3'
        close
    end
end

def close
    puts "Thank you for trying the Youtube Channel CLI information search!"
    exit(true) 
end

intro()



#print(channel.name) DO NO USE
#print(channel.id) DO NOT USE