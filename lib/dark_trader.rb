require 'nokogiri'
require 'open-uri'
require 'rest-client'

#----- Get 1 name of crypto & 1 price displayed -----#
page = Nokogiri::HTML(RestClient.get("https://coinmarketcap.com/all/views/all/"))

bitcoin_info = [bitcoin_name = page.xpath('//*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]/div/a[2]'), bitcoin_price = page.xpath('//*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[5]/div/a/span')]

puts bitcoin_name.text + " = " + bitcoin_price.text

#---------------------Create array with 10 names and array with 10 values--------------------------------#

def get_10_names_and_prices

    page_2 = Nokogiri::HTML(RestClient.get("https://coinmarketcap.com/all/views/all/"))

    crypto_data = Array.new #ça crée une array

    page_2.xpath('//*[@id="__next"]/div[2]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[position() <= 10]').each do |crypto_row| 
    #on crée 10 rangées à partir de la table selectionnée dans le site qu'on nomme crypto_row
    crypto_name = crypto_row.at_xpath('.//td[2]/div/a[2]').text.strip
    #1. on crée une variable avec un nom cohérent pour s'y réfere plus tard (crypto_name) 
    #2. on selectionne les rangées que l'on vient de compartimenter avec each do (crypto_row)
    #3. .at_xpath permets de demander à récupérer l'info qui se situe à un endroit précis
    #4. (..) indiquera le xpath précis de l'élément en question
    #5. On vient de séléctionner les noms des cryptomonnaies se trouvant col 2 des rangées séléctionnées
    #6. Elles se trouvent maintenant dans "crypto_name"
    #7. On ajoute .text pour ne choisir que le texte et .strip pour un formatage propre, sans espaces inutiles, etc...
    crypto_price = crypto_row.at_xpath('.//td[5]/div/a/span').text.strip
    #même démarche pour le prix
    crypto_data << { name: crypto_name, price: crypto_price } #pour envoyer les infos vers l'array crypto_data qui va permettre plus tard l'affichage 
    end
    return crypto_data
end

puts get_10_names_and_prices