require 'rails_helper'

describe "the topic page", :type => :feature do

  let! (:topic) { Topic.create!(name:'Steven')}
  let! (:test_user) { User.create!(username:'steven', email:'steven@example.com', password:'12345')}

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(test_user)
  end

  it "shows a list of topics" do
    visit '/'
    expect(page).to have_content topic.name
  end

  it "includes clickable topics" do
    visit '/'
    click_link topic.name
    expect(page).to have_selector('[data-purpose="topic_name"]')
  
  end

end