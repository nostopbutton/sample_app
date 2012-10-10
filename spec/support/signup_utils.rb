def valid_signup
  fill_in "Name",             with: "Example User"
  fill_in "Email",            with: "user@example.com"
  fill_in "Password",         with: "foobar"
  fill_in "Confirm Password", with: "foobar"
end

def increase_user_count
  change(User, :count).by(1)
end

RSpec::Matchers.define :be_signup_page do
  match do |page|
    page.should have_selector('h1',    text: 'Sign up')
    page.should have_selector('title', text: 'Sign up')
  end
end