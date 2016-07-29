

#curl -i -H "Accept: application/json" "https://api1.27hub.com/api/emh/a/v2?e=thomasjfiravich@gmail.com&k=B282D87D"

require 'rest-client'
require 'json'

File.open("/Users/colton/Projects/unfinished_business/poke/newsletter/emails_good.txt", 'w') do |output|
  File.open("/Users/colton/Projects/unfinished_business/poke/newsletter/emails.txt", "r") do |input|
    input.each_line do |email|
      response = RestClient.get "https://api1.27hub.com/api/emh/a/v2?e=#{email}&k=B282D87D", {:accept => :json}
      response = JSON.parse(response.body)
      if response["result"] == 'Ok'
        output.write(email)
        puts "YAAAAAAAAYYYYYYYYY #{response}"
      elsif response["result"] == 'Bad'
        "BOOOOOOOOOOOO"
      end
    end
    input.close
  end
  output.close
end


# @emails = File.open("/Users/colton/Projects/unfinished_business/poke/newsletter/emails.txt")
#
# # @emails.each_line do |email|
# #   response = RestClient.get "https://api1.27hub.com/api/emh/a/v2?e=#{email}&k=B282D87D", {:accept => :json}
# #   response = JSON.parse(response.body)
# #   if response["result"] == 'Bad'
# #     puts "BAD EMAIL #{email}"
# #     @emails.delete(email)
# #   end
# # end


#response = RestClient.get 'https://api1.27hub.com/api/emh/a/v2?e=Annaharrod@gmail.com&k=B282D87D', {:accept => :json}
