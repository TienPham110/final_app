require "rails_helper"

RSpec.describe "sign up", :type => :system do
  scenario 'without enough information' do
    sign_up_with 'Tien', 'Pham','', '123456789', '123456789'
    expect(page).to have_content('Please enter your email')

    sign_up_with '', 'Pham','valid@example.com', '123456789', '123456789'
    expect(page).to have_content('Please enter your first name')

    sign_up_with 'Tien', '','valid@example.com', '123456789', '123456789'
    expect(page).to have_content('Please enter your last name')

    sign_up_with 'Tien', 'Pham','valid@example.com', '', ''
    expect(page).to have_content('Please enter your password')

    sign_up_with 'Tien', 'Pham','valid@example.com', '123456789', ''
    expect(page).to have_content('Please enter your password again')

    sign_up_with 'Tien', 'Pham','valid@example.com', '', '12345679'
    expect(page).to have_content('Please enter the same password')
    
  end

  scenario 'with enough information' do
    sign_up_with 'Tien', 'Pham','valid@example.com', '123456789', '123456789'

    expect(page.current_path).to eq new_user_session_path
  end

  def sign_up_with(firstName,lastName,email,password,password_confirmation)
    visit new_user_registration_path
    fill_in 'user_firstName', with: firstName
    fill_in 'user_lastName', with: lastName
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password_confirmation
    click_button 'commit'
  end
end