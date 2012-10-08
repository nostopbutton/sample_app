RSpec::Matchers.define :be_profile_page do |user|
  match do |page|
    page.should have_selector('h1',   text: user.name) 
    page.should have_selector('title', text: user.name)
  end
end

RSpec::Matchers.define :be_edit_page do #|user|
  match do |page|
    page.should have_selector('h1',     text: "Update your profile") 
    page.should have_selector('title',  text: "Edit user")
    page.should have_link('change',     href: 'http://gravatar.com/emails')
  end
end
