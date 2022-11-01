require 'rails_helper'

describe "Beer" do
  let!(:brewery) { FactoryBot.create :brewery, name: "Koff" }
  let!(:beer1) { FactoryBot.create :beer, name: "Iso 3",style: "Lager" , brewery:brewery }


  it "create a beer" do
    expect(Beer.count).to eq(1)
    expect(beer1).to be_valid
  end
end