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

describe "the infinite scroll process " do
  let(:user) { FactoryGirl.create(:user) }


  before do
    sign_in(user)
  end

  it "fetches more tweets when scrolling to bottom", js: true do
    30.times do |n|
      Tweet.create(body: n+1, user: user)
    end
    visit tweets_path
    page.save_screenshot('lib/screenshot.png', :full => true)
    expect(page).to have_content('1 oldirtytester')
    expect(page).to_not have_content('30 oldirtytester')
    page.evaluate_script("window.scrollTo(0, document.height)")
    expect(page).to have_content('30 oldirtytester')
  end
end
