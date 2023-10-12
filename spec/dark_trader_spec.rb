require_relative '../lib/dark_trader.rb'

describe "get_10_names_and_prices" do
    it "gets a list of 10 names and prices" do
      expect(get_10_names_and_prices).to eq(town_names)
    end
  end