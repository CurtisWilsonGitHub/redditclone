require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.create!(name: "redditclone user", email: "reddictcloneuser@redditclone.com", password: "password")}

  #shoulda tests for name
  it { is_expected.to validate_presence_of(:name)}
  it { is_expected.to validate_length_of(:name).is_at_least(1)}

  #shoulda test for email
  it { is_expected.to validate_presence_of(:email)}
  it { is_expected.to validate_uniqueness_of(:email)}
  it { is_expected.to validate_length_of(:email).is_at_least(3)}
  it { is_expected.to allow_value("reddictcloneuser@redditclone.com").for(:email)}

  #shoulda tests for password
  it { is_expected.to validate_length_of(:password)}
  it { is_expected.to have_secure_password}
  it { is_expected.to validate_length_of(:password).is_at_least(6) }

  describe "attribute" do
    it "should have name and email attributes" do
      expect(user).to have_attributes(name: "Redditclone User", email: "reddictcloneuser@redditclone.com")
    end
  end

  describe "invalid user" do
    let(:user_with_invalid_name) {User.new(name: "", email: "reddictcloneuser@redditclone.com")}
    let(:user_with_invalid_email) {User.new(name: "Redditclone User", email: "")}

    it "should be an invalid user due to blank name" do
      expect(user_with_invalid_name).to_not be_valid
    end

    it "should be an invalid user due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end
  end

  describe "user name capitalized" do
    capitalized_name = "Redditclone User"
    it "should capitalize first letter of name" do
      expect(user.name).to eq(capitalized_name) 
    end
  end
    
end
