require 'nokogiri'
require 'open-uri'
require 'rest-client'


#------------Get 1 town email--------------#

#def get_townhall_email

    #townhall_url = Nokogiri::HTML(RestClient.get("https://www.annuaire-des-mairies.com/66/prades"))
    #first_email = townhall_url.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')

    #puts "Voici l'adresse email de la ville de Prades : " + first_email.text
#end


#------------------END--------------------#

#---------------------------Getting all town names------------------------#

def get_all_town_names
    
    all_towns = Nokogiri::HTML(RestClient.get("https://www.annuaire-des-mairies.com/val-d-oise.html"))

    town_names = Array.new

    all_towns.xpath('//td[2]/p/a').each do |all_names|
        names = all_names.text.strip.split("\n")
        town_names << names
        end
    return town_names
end

puts get_all_town_names

#-----------------------------------END---------------------------------------#

all_urls = Nokogiri::HTML(RestClient.get("https://www.annuaire-des-mairies.com/val-d-oise.html"))

url = []

path = all_towns.xpath