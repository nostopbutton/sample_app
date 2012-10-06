def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

RSpec::Matchers.define :be_signed_out do
  match do |page|
    page.should_not have_link('Profile')
    page.should_not have_link('Sign out')
    page.should have_link('Sign in', href: signin_path)
  end
end

RSpec::Matchers.define :be_signed_in do |user|
  match do |page|
    page.should have_link('Profile', href: user_path(user))
    page.should_not have_link('Sign in')
    page.should have_link('Sign out', href: signout_path)
  end
end

RSpec::Matchers.define :be_signin_page do
  match do |page|
    page.should have_selector('h1',    text: 'Sign in')
    page.should have_selector('title', text: 'Sign in')
  end
end