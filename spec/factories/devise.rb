

FactoryBot.define do
  factory :user do
    #sequence(:login) { |n| "testuser#{n}" }
    name { "Test User" }
    
    sequence(:email) { |n| "test#{n}@user.com"}
    password {"qwerty"}
    password_confirmation {"qwerty"}
    # Add additional fields as required via your User model
  end

  # Not used in this tutorial, but left to show an example of different user types
  # factory :admin do
  #   id {2}
  #   email {"test@admin.com"}
  #   password {"qwerty"}
  #   admin {true}
  # end
end