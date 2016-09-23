require 'rails_helper'

RSpec.describe User, type: :model do
  it "must have a name" do
  	user = User.new(name: '')
  	expect(user).to be_invalid
  end
  it "must have an alphabetical name" do
  	user =User.new(
  		name: "1234123",
  		description: "this is valid",
  		email: "Valid@email.com"
  		)
  	expect(user).to be_invalid
  end
  it "must have a description" do
  	user = User.new(
  		name: "Jacob",
  		description:''
  		)
  	expect(user).to be_invalid
  end
  it "must have a vaild email" do
  	user = User.new(
  		name: "Jacob",
  		description:"I hope i'm doing this correctly",
  		email: "notvalid"
  		)
  	expect(user).to be_invalid
  end
end
