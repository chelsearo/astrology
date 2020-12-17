class Astrology::CLI
    
    def call
        puts ""
        puts "Welcome to your daily horoscope!"
        puts ""
        puts "To view a list of signs please type 'Signs'."
        puts ""
        puts "To view your horoscope type in your sign."
        puts ""
        puts "To exit, enter 'Exit'."
        Astrology::API.new.fetch(input)
        display_info
        loop_or_exit
        
        
        
       
        
    end
        
    def display_info
       astrology = Astrology::Description.all.last
       puts "color : #{astrology.color}"
       puts "compatibilty : #{astrology.compatibilty}"
       puts "date_range : #{astrology.date_range}"
       puts "description : #{astrology.description}"
       puts "lucky_number : #{astrology.lucky_number}"   
       puts "lucky_time : #{astrology.lucky_time}"
       puts "mood : #{astrology.mood}"
       puts "sign : #{astrology.sign}"
    
    end


    def input
        
         input = gets.chomp.downcase

        if input == "signs"
           signs_list
           
        
        elsif input == "exit" 
               goodbye 
        
        else  
            input
            
        end
     
        
    end

    def signs_list
        
        signs = ["Aries: March- April 19", "Taurus: April 20- May 20", "Gemini: May 21- June 20", "Cancer: June 21- July 22", "Leo: July 23- August 22", "Virgo: August 23- September 22", "Libra: September 23- October 22", "Scorpio: October 23- November 21", "Sagittarius: November 22- December 21", "Capricorn: December 22- January 19", "Aquarius: January 20- February 18", "Pisces: February 19- March 20"]
        signs.each do |signs|
          puts signs
        end
        puts "Which Sign would you like to read about today?"
         input = gets.chomp
         
       
        
    end

     def your_sign
        display_info
     end

    


    def goodbye
        puts "Goodbye!"
        exit
    end


    def loop_or_exit 
    
     puts ""
     puts ""
     puts "Would you like to view a different sign?(Y/N)"
     
     input = gets.chomp.downcase
        
      if input == "y"
          call
        
      else puts "Would you like to see your Horoscope history?(Y/N)"
           new_input = gets.chomp.downcase
           history(new_input)

      end
    end


    def display_all_history
        Astrology::Description.all.each.with_index(1) do |d,index|
            puts "#{index}. #{d.description}"
        end 
    
    end



    def history(input)
        if input == "y"
           display_all_history
           loop_or_exit
        else 
            goodbye
        end
    end



end