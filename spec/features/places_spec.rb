require 'rails_helper'


describe "Places" do
  it "if multiple beer locations found the API should return all of them" do

    #pass the method place in Beermappingapi with paramater london and return
    allow(BeermappingApi).to receive(:places_in).with("london").and_return(
      [ Place.new(name: "Anchor Tap", id:5598 ),
        Place.new(name: "The Harp", id:5609 )],)

    visit places_path

    fill_in('city', with: 'london')
    click_button "Search"

    expect(page).to have_content "Anchor Tap"
    save_and_open_page
  end
  it "if no location found, should return no location in london" do
    allow(BeermappingApi).to receive(:places_in).with("london").and_return([])

    visit places_path

    fill_in('city', with: 'london')
    click_button "Search"

    expect(page).to have_content "No locations in london"
    save_and_open_page
  end
  end



describe "BeermappingApi" do
  it "When HTTP GET returns one entry, it is parsed and returned" do

    canned_answer = <<-END_OF_STRING
<?xml version='1.0' encoding='utf-8' ?><bmp_locations><location><id>18856</id><name>Panimoravintola Koulu</name><status>Brewpub</status><reviewlink>https://beermapping.com/location/18856</reviewlink><proxylink>http://beermapping.com/maps/proxymaps.php?locid=18856&amp;d=5</proxylink><blogmap>http://beermapping.com/maps/blogproxy.php?locid=18856&amp;d=1&amp;type=norm</blogmap><street>Eerikinkatu 18</street><city>Turku</city><state></state><zip>20100</zip><country>Finland</country><phone>(02) 274 5757</phone><overall>0</overall><imagecount>0</imagecount></location></bmp_locations>
    END_OF_STRING

    stub_request(:get, /.*turku/).to_return(body: canned_answer, headers: { 'Content-Type' => "text/xml" })

    places = BeermappingApi.places_in("turku")

    expect(places.size).to eq(1)
    place = places.first
    expect(place.name).to eq("Panimoravintola Koulu")
    expect(place.street).to eq("Eerikinkatu 18")
  end

  it "HTTP Get should return all the beer locations found" do

    canned_answer = <<-END_OF_STRING
<?xml version='1.0' encoding='utf-8' ?><bmp_locations><location><id>18856</id><name>Panimoravintola Koulu</name><status>Brewpub</status><reviewlink>https://beermapping.com/location/18856</reviewlink><proxylink>http://beermapping.com/maps/proxymaps.php?locid=18856&amp;d=5</proxylink><blogmap>http://beermapping.com/maps/blogproxy.php?locid=18856&amp;d=1&amp;type=norm</blogmap><street>Eerikinkatu 18</street><city>Turku</city><state></state><zip>20100</zip><country>Finland</country><phone>(02) 274 5757</phone><overall>0</overall><imagecount>0</imagecount></location></bmp_locations>
    END_OF_STRING

    stub_request(:get, /.*turku/).to_return(body: canned_answer, headers: { 'Content-Type' => "text/xml" })

    places = BeermappingApi.places_in("turku")

    firstPlace = places.first

    expect(places.size).to eq(1)
    expect(firstPlace.name).to eq("Panimoravintola Koulu")
  end

end