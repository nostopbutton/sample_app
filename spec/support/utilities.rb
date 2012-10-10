include ApplicationHelper

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

RSpec::Matchers.define :be_home_page do
  match do |page|
    page.should have_selector('title', text: 'Ruby on Rails Tutorial Sample App')
    page.should have_selector('h1',    text: 'Welcome to the Sample App')
    # TODO - this is not right if signed in
    page.should have_link('Sign up now!', href: signup_path)
  end
end