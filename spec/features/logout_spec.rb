require "rails_helper"

  describe "the sign out a user process" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_in(user)
    end

    it "signs out a user" do
      visit root_path
      click_on "Logout"
      expect(page).to have_content "Signed out successfully."
    end
  end


#
# describe "the sign out a user process" do
#   describe "the sign out a user process" do
#     it "signs out a user" do
#       user = FactoryGirl.create(:user)
#       visit root_path
#       click_on "Logout"
#       expect(page).to have_content "Signed out successfully."
#     end
