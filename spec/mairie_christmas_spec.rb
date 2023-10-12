require_relative '../lib/mairie_christmas.rb'

describe "get_townhall_email" do
    it "displays one town email" do
      expect(get_townhall_email).to eq("Voici l'adresse email de la ville de Prades : mairie.prades@wanadoo.fr")
    end
  end