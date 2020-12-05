require 'json'
class Astrology:: API 
    
  def fetch(sign)

    
    require 'uri'
    require 'net/http'
    require 'openssl'
    
    url = URI("https://sameer-kumar-aztro-v1.p.rapidapi.com/?day=today&sign=#{sign}")
    
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    
    request = Net::HTTP::Post.new(url)
    request["x-rapidapi-key"] = '386b6033a1msh6f44efb8b0cf85ep163d4ejsn9eb088a488a1'
    request["x-rapidapi-host"] = 'sameer-kumar-aztro-v1.p.rapidapi.com'
   

    response = http.request(request)
    astrology = JSON.parse(response.read_body)
    if !astrology["message"]
      
      description = astrology["description"]
      date_range = astrology["date_range"]
      compatibilty = astrology["compatibily"]
      mood = astrology["mood"]
      color = astrology["color"]
      lucky_number = astrology["lucky_number"] 
      lucky_time = astrology["lucky_time"]
      
     Astrology::Description.new(description, date_range, sign, compatibilty, mood, color, lucky_number, lucky_time)
     else 
      puts "Sorry, We could not find any description history. Please check spelling and try again."
      input = gets.chomp.downcase
      if input == "exit"
        exit 
      else
      self.fetch(input)
     end
    end 

    
    
    
    
    
    
    
     
 
  end

end