require 'rails_helper'

describe "Breweries page" do
  it "should not have any before been created" do
    visit breweries_path
    expect(page).to have_content 'Number of breweries: 0'

  end

  describe "when breweries exists" do
    before :each do
      @breweries = ["Hartwall", "Karjala", "Schlenkerla"]
      year = 1039
      @breweries.each do |brewery_name|
        FactoryBot.create(:brewery, name: brewery_name, year: year += 1)
      end

      visit breweries_path
    end

    it "lists the breweries and their total number" do
      expect(page).to have_content "Number of breweries: #{@breweries.count}"
      @breweries.each do |brewery_name|
        expect(page).to have_content brewery_name
      end
    end

    it "allows user to navigate to page of a Brewery" do
      click_link "Hartwall"

      expect(page).to have_content "Hartwall"
      expect(page).to have_content "beers count are: 0"
       expect(page).to have_content "Establisched in: 1040"

      save_and_open_page
    end


    end

end
