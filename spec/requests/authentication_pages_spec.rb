require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should be_signin_page }
    it { should be_signed_out }
  end

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }
      it { should be_signin_page }
      it { should have_error_message('Invalid') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_error_message() }
      end
    end

    describe "with valid information" do
      let(:user) {FactoryGirl.create(:user) }
      before { valid_signin(user) }
      it { should be_profile_page(user) }
      it { should be_signed_in(user) }
      it { should_not have_error_message() }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should be_signed_out }
        it { should_not have_error_message() }
      end
    end
  end
end
