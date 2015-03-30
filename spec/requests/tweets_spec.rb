# describe "Tweets" do
#   it "fetches more tweets when scrolling to bottom", js: true do
#     18.times { |n| Tweet.create! body: n+1 }
#     visit tweets_path
#     page.should have_content(1)
#     page.should_not have_content(18)
#     page.evaluate_script("window.scrollTo(0, document.height)")
#     page.should have_content(18)
#   end
# end
