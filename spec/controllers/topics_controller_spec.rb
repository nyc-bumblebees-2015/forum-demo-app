require 'rails_helper'

RSpec.describe TopicsController, :type => :controller do

  let (:some_test_user) { User.create!(username:'steven', email:'steven@example.com', password:'12345')}
  let! (:sample_topic) { Topic.create!(name:'random data') }

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(some_test_user)
  end


  describe "#index" do

    it "assigns @topics" do
      get :index
      expect(assigns(:topics)).to eq([sample_topic])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

  end

  describe "#show" do
    it "assigns a topic" do
      get :show, id: sample_topic.id
      expect(assigns(:topic)).to eq(sample_topic)
    end

    it "renders show" do
      get :show, id: sample_topic.id
      expect(response).to render_template("show")
    end
  end

  describe "#update" do
    it "saves a valid update" do
      put :update,  {id: sample_topic.id, topic:{name: 'Awesome topic'}}
      expect(response).to redirect_to topic_path(sample_topic.reload)
    end

    it "won't save a bad update" do
      old_name = sample_topic.name
      put :update,  {id: sample_topic.id, topic:{name: nil}}
      expect(response).to render_template("edit")
      expect(sample_topic.reload.name).to eq(old_name)
    end
  end

  describe "#delete" do
    it "deletes the topic" do
      old_count = Topic.count
      delete :destroy, id: sample_topic.id
      expect(response).to redirect_to(topics_path)
      expect(Topic.count).to eq(old_count -1)
      expect(Topic.where(id: sample_topic.id).count).to eq(0)
    end
  end
end