require 'nokogiri'
require 'open-uri'
require 'rest-client'

=begin 
page = Nokogiri::HTML(URI.open("ton_url_a_scrapper.com")) #indique la page dont les données doivent être récupérées
puts page.class --------------------------
page = Nokogiri::HTML(RestClient.get("https://coinmarketcap.com/all/views/all/"))   
puts page.class ---------------------------------
=end

#----- Get 1 name of crypto & 1 price displayed -----#
page = Nokogiri::HTML(RestClient.get("https://coinmarketcap.com/all/views/all/"))

bitcoin_info = [bitcoin_name = page.xpath('//*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]/div/a[2]'), bitcoin_price = page.xpath('//*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[5]/div/a/span')]

puts bitcoin_name.text + " = " + bitcoin_price.text
#-----------------------------------------------------#

#test_is = page.xpath('//td/*')

#test_is.each do |key, value|
    #puts key.text
    #puts value.to_s
#end
