require 'nokogiri'
require 'open-uri'
require 'rest-client'

#---------------Get 1 town email--------------#

def get_townhall_email

    townhall_url = Nokogiri::HTML(RestClient.get("https://www.annuaire-des-mairies.com/66/prades"))
    first_email = townhall_url.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')

    puts "Voici l'adresse email de la ville de Prades : " + first_email.text
end

#---------------------END--------------------#

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

#---------------------------Getting all town URLs--------------------------------#

def get_all_town_urls

all_urls = Nokogiri::HTML(RestClient.get("https://www.annuaire-des-mairies.com/val-d-oise.html"))

town_urls = Array.new

all_urls.xpath('//td[2]/p/a/@href').map(&:value).each do |every_urls|

    urls = every_urls.split("\n")
    town_urls << urls
end
    return town_urls
end

puts get_all_town_urls

#-----------------------------------END---------------------------------------#

#-----------------------------Getting town emails-----------------------------#

#l'idée était de faire une boucle qui scanne toutes les urls et remplace la fin par les urls scrappées précédemment
    #Nokogiri::HTML(RestClient.get("https://www.annuaire-des-mairies.com/#{i}.html (boucle qui sort toutes les urls))
    #ensuite, un .scan avec la variable pour récupérer l'élément adresse email des pages compartimentées
    #une fois les adresses emails isolées, envoyer tout ça dans une array qui stocke les emails
    #fusionner l'array town_names avec l'array emails_isolated
#faire une méthode qui affiche la combinaison des 2 arrays citées précédemment