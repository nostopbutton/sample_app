RSpec::Matchers.define :be_profile_page do |user|
  match do |page|
    page.should have_selector('h1',   text: user.name) 
    page.should have_selector('title', text: user.name)
  end
end
