require 'rails_helper'

RSpec.describe Beer, type: :model do
  it 'beer to created if the style and name is set ' do
    brewery = Brewery.create name:"heil", year:"2000"
    beer = Beer.create name:"al", style:"Lager" , brewery:brewery
    expect(beer).to be_valid
    expect(Beer.count).to eq(1)
  end
end