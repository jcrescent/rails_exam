require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it "routes /users to the index method" do
    expect(:get =>"/users").to route_to(:controller => "users", :action => "index")
  end
  it "routes /users/:id to the show method" do
    expect(:get => "/users/1").to route_to(:controller => "users", :action => "show", "id"=>"1")
  end
end
