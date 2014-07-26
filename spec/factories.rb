FactoryGirl.define do
  factory :feed do
    sequence(:name) { |n| "feed name #{n}" }
    feed_url "http://feeds.feedburner.com/railscasts"
  end
end
