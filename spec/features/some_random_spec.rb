require 'rails_helper'

describe "the topic page", :type => :feature do

  before :each do
  end

  it "shows a list of topics" do
    visit '/'
    expect(page).to have_content 'Topics'
  end
end