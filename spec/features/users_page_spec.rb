require 'rails_helper'
include Helpers

=begin
describe "User" do
  before :each do
    FactoryBot.create :user
  end
=end

describe "who has signed up" do
    it "should login in with this user info" do
        sign_in(username:"Pekka", password: "Foobar1")

        expect(page).to have_content 'Welcome back!'
        save_and_open_page

    end
  end
describe "add new beer " do
  let!(:brewery) { FactoryBot.create :brewery, name: "Koff" }
  let!(:beer1) { FactoryBot.create :beer, name: "Iso 3",style: "Lager" , brewery:brewery }
  let!(:user) { FactoryBot.create(:user) }
  let!(:rating1) { FactoryBot.create :rating,beer: beer1 , score: 20 , user:user}
  let!(:rating2) { FactoryBot.create :rating, beer: beer1, score: 20 , user:user}

  it"shoud add a beer if" do
    expect(beer1).to be_valid
    save_and_open_page
      end

  it 'should show all the ratings of the user ' do
      visit user_path(user)

      expect(rating1).to be_valid
      expect(user.ratings.count).to eq(2)

      save_and_open_page
      expect{
        click_button('delete')

      }.to change{user.ratings.count}.by(1)

  end


  end





