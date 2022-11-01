module Helpers

  def sign_in(credentials)
    visit signin_path
    fill_in('username', with:credentials[:username])
    fill_in('password', with:credentials[:password])
    click_button('Log in')
  end

  def sign_up(credentials)
    visit signup_path
    fill_in('Username', with:credentials[:username])
    fill_in('Password', with:credentials[:password])
    fill_in('Password confirmation', with:credentials[:password_confirmation])
    click_button('Create User')
  end
end