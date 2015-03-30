require 'rails_helper'

describe "the tweet process" do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in(user)
  end

  it 'adds a new tweet' do
    visit tweets_path
    click_on "New Tweet"
    fill_in "Body", with: "STFD"
    click_on "Create Tweet"
    expect(page).to have_content 'Tweet successfully added!'
  end

  it 'deletes a tweet' do
    visit tweets_path
    click_on "New Tweet"
    fill_in "Body", with: "STFD"
    click_on "Create Tweet"
    click_on "Destroy"
    expect(page).to have_content 'Tweet successfully deleted!'
  end

end
