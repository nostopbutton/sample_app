include ApplicationHelper

# def valid_signin(user)
#   fill_in "Email",    with: user.email
#   fill_in "Password", with: user.password
#   click_button "Sign in"
# end

# def valid_signup
#   fill_in "Name",         with: "Example User"
#   fill_in "Email",        with: "user@example.com"
#   fill_in "Password",     with: "foobar"
#   fill_in "Confirmation", with: "foobar"
# end

# def increase_user_count
#   change(User, :count).by(1)
# end

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-success', text: message)
  end
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

# RSpec::Matchers.define :be_signed_out do
#   match do |page|
#     page.should_not have_link('Profile')
#     page.should_not have_link('Sign out')
#     page.should have_link('Sign in', href: signin_path)
#   end
# end

# RSpec::Matchers.define :be_signed_in do |user|
#   match do |page|
#     page.should have_link('Profile', href: user_path(user))
#     page.should_not have_link('Sign in')
#     page.should have_link('Sign out', href: signout_path)
#   end
# end

# RSpec::Matchers.define :be_signin_page do
#   match do |page|
#     page.should have_selector('h1',    text: 'Sign in')
#     page.should have_selector('title', text: 'Sign in')
#   end
# end

# RSpec::Matchers.define :be_signup_page do
#   match do |page|
#     page.should have_selector('h1',    text: 'Sign up')
#     page.should have_selector('title', text: 'Sign up')
#   end
# end

# RSpec::Matchers.define :be_profile_page do |user|
#   match do |page|
#     page.should have_selector('h1',   text: user.name) 
#     page.should have_selector('title', text: user.name)
#   end
# end