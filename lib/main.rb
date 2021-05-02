require_relative 'channel.rb'

def intro
    puts "======================================================================"
    puts "=       Welcome to the Youtube Channel CLI information search!       =" 
    puts "=            Please select from the following options!               ="
    puts "= Type '1' to search by channel or type '2' to close the application ="
    puts "======================================================================"
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
    begin
        @user_input = gets.strip
        @channel = Channel.new(@user_input)
    rescue StandardError => e
        puts "I'm sorry. I could not find that channel."
        puts "Please enter the name of a channel that you would like to learn more about."
        retry
    else
        $all_channels << @channel.name
        $all_channels_and_items << ["#{@channel.name}", ["#{(@channel.video_count)}", "#{(@channel.date_created)}", "#{(@channel.description)}", "#{(@channel.video_count)}", "#{(@channel.subscriber_count)}"]]
        channel_options
    end
end

def channel_options
    puts "Type '1' to see the total view count for #{@user_input}."
    puts "Type '2' to see the date that #{@user_input} was created."
    puts "Type '3' to see the channel description for #{@user_input}."
    puts "Type '4' to see the number of videos that #{@user_input} has posted."
    puts "Type '5' to see the the total subscriber count for #{@user_input}."
    puts "Type '6' to see all of the above options for #{@user_input}."
    puts "Type '7' to see all current and previous channel searches."
    puts "Type '8' to see all current and previous channels and items."
    puts "Type '9' to close the application."
    user_input = gets.strip
    while user_input != '1' && user_input != '2' && user_input != '3' && user_input != '4' && user_input != '5' && user_input != '6' && user_input != '7' && user_input != '8' && user_input != '9'
        puts "That was not a valid entry. Please select from the following:"
        puts "Type '1' to see the total view count for #{@user_input}."
        puts "Type '2' to see the date that #{@user_input} was created."
        puts "Type '3' to see the channel description for #{@user_input}."
        puts "Type '4' to see the number of videos that #{@user_input} has posted."
        puts "Type '5' to see the the total subscriber count for #{@user_input}."
        puts "Type '6' to see all of the above options for #{@user_input}."
        puts "Type '7' to see all current and previous channel searches."
        puts "Type '8' to see all current and previous channels and items."
        puts "Type '9' to close the application."
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
    elsif user_input == '6'
        all_instance_items
    elsif user_input == '7'
        all_channels
    elsif user_input == '8'
        all_channels_and_items
    elsif user_input == '8'
        close
    end
end

def view_count
    puts "#{(@channel.video_count)}"
    where_to_next
end

def date_created
    puts "#{(@channel.date_created)}"
    where_to_next
end

def description 
    puts "#{(@channel.description)}"
    where_to_next
end

def video_count
    puts "#{(@channel.video_count)}"
    where_to_next
end

def subscriber_count
    puts "#{(@channel.subscriber_count)}"
    where_to_next
end

def all_instance_items
    @channel.all_instance_items.each {|items| print items, "\n" }
    where_to_next
end

def all_channels
    $all_channels.each {|channels| print channels, "\n" }
    where_to_next
end

def all_channels_and_items
    $all_channels_and_items.each {|channel, items| puts "This channel's name is :" + "#{channel}" + "\n" + "#{items[0]}" + "\n" + "#{items[1]}" + "\n" + "#{items[2]}" + "\n" + "#{items[3]}" + "\n" + "#{items[4]}" +"\n"}
    puts where_to_next
end

def where_to_next
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
    puts "======================================================================"
    puts "=  Thank you for trying the Youtube Channel CLI information search!  ="
    puts "======================================================================"
    exit(true) 
end

intro()