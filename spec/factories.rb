FactoryBot.define do
  factory :user do
    username { "Pekka" }
    password { "Foobar1" }
    password_confirmation { "Foobar1" }
  end

  factory :brewery do
    name { "anonymous" }
    year { 1900 }
  end

  factory :beer do
    name { "anonymous" }
    style { "Lager" }
    brewery # a brewery related to beer is created at a brewery
  end

  factory :rating do
    score { 10 }
    beer #the beer related to the rating is created at the beer factory
    user #the user related to rating is created in the user factory
  end

end