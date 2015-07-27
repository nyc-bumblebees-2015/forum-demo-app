class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update(topic_params)
    if @topic.save
      redirect_to topic_path(@topic)
    else
      render :edit
    end
  end

  def destroy
    target = Topic.find(params[:id])
    if target.destroy
      redirect_to topics_path
    else
      redirect_to topic_path(target)
    end

  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end
end