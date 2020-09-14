require "rails_helper"

RSpec.describe "signup", :type => :request do

  scenario "request to action new" do
    get new_user_registration_path
    expect(response).to render_template(:new)
  end

  scenario "request to action create without enough params" do
    post user_registration_path, params: {firstName:"Tien", lastName:"Pham", email: "a@example.com", password: "123456789"}
    expect(response).to render_template(:new)

    post user_registration_path, params: {lastName:"Pham", email: "a@example.com", password: "123456789", password_confirmation: "123456789"}
    expect(response).to render_template(:new)

    post user_registration_path, params: {firstName:"Tien", lastName:"Pham", password: "123456789", password_confirmation: "123456789"}
    expect(response).to render_template(:new)

    post user_registration_path, params: {firstName:"Tien", lastName:"Pham", email: "a@example.com", password_confirmation: "123456789"}
    expect(response).to render_template(:new)

  end

  scenario "request to action create with enough params" do
    post user_registration_path, params: {firstName:"Tien", lastName:"Pham", email: "a@yopmail.com", password: "123456789", password_confirmation:"123456789"}
    response = get new_user_session_path
    expect(response).to redirect_to ENV["REDIRECT_URL"]
  end

end