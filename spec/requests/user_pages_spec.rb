require 'spec_helper'

describe "User pages" do

  subject { page }

  shared_examples_for "signup error" do
    it { should be_signup_page }
    it { should have_content('error') }
    it { should be_signed_out }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should be_signup_page }
    it { should be_signed_out }
  end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should be_profile_page(user) }
  end

  describe "signup" do
    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to increase_user_count
      end

      describe "after submission" do
        before { click_button submit }

        it_should_behave_like "signup error"
      end

      describe "with Name missing" do
        before do
          fill_in "Email",    with: "user@example.com"
          fill_in "Password", with: "foobar"
          fill_in "Confirmation", with: "foobar"
        end

        it "should not create a user" do
          expect { click_button submit }.not_to increase_user_count
        end
        describe "after submission" do
          before { click_button submit }

          it_should_behave_like "signup error"
          it { should have_content('Name can\'t be blank') }
        end
      end

      describe "with Email missing" do
        before do
          fill_in "Name",     with: "Example User"
          fill_in "Password", with: "foobar"
          fill_in "Confirmation", with: "foobar"
        end

        it "should not create a user" do
          expect { click_button submit }.not_to increase_user_count
        end
        describe "after submission" do
          before { click_button submit }

          it_should_behave_like "signup error"
          it { should have_content('Email can\'t be blank') }
          it { should have_content('Email is invalid') }
        end
      end

      describe "with Password missing" do
        before do
          fill_in "Name",     with: "Example User"
          fill_in "Email",    with: "user@example.com"
          fill_in "Confirmation", with: "foobar"
        end

        it "should not create a user" do
          expect { click_button submit }.not_to increase_user_count
        end
        describe "after submission" do
          before { click_button submit }

          it_should_behave_like "signup error"
          it { should have_content('Password can\'t be blank') }
          it { should have_content('Password is too short') }
        end
      end 
      describe "with Password too short" do
        before do
          fill_in "Name",     with: "Example User"
          fill_in "Email",    with: "user@example.com"
          fill_in "Password", with: "fooba"
          fill_in "Confirmation", with: "fooba"
        end

        it "should not create a user" do
          expect { click_button submit }.not_to increase_user_count
        end
        describe "after submission" do
          before { click_button submit }

          it_should_behave_like "signup error"
          it { should have_content('Password is too short') }
        end
      end 
      describe "with Password Confirmation missing" do
        before do
          fill_in "Name",     with: "Example User"
          fill_in "Email",    with: "user@example.com"
          fill_in "Password", with: "foobar"
        end

        it "should not create a user" do
          expect { click_button submit }.not_to increase_user_count
        end
        describe "after submission" do
          before { click_button submit }

          it_should_behave_like "signup error"
          it { should have_content('Password confirmation can\'t be blank') }
        end
      end 
    end

    describe "with valid information" do
      before { valid_signup } 

      it "should create a user" do
        expect { click_button submit }.to increase_user_count
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_email('user@example.com') }

        it { should have_success_message('Welcome') }
        it { should be_profile_page(user) }
        it { should be_signed_in(user) }
      end
    end
  end
end


