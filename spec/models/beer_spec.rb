require 'rails_helper'

RSpec.describe Beer, type: :model do
  it 'beer to created if the style and name is set ' do
    beer = Beer.create id:"36",  name:"al", style:"Lager", brewery_id:"10"
    expect(beer).to be_valid
    expect(Beer.count).to eq(1)
  end
end