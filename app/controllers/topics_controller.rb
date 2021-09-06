class TopicsController < ApplicationController
    before_action :set_topic, only: [:edit, :update]
   
   def new
      @topic = topic.new
   end
   
   def edit
   end
   
   def create
      @topic = topic.new(topic_params)
      
      respond_to do |format|
         if @topic.save
            format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
            format.json { render :show, status: :created, location: @topic }
         else
            format.html { render :new }
            format.json { render json: @topic.errors, status: :unprocessable_entity }
         end
      end
      
   end
   
   def update
      respond_to do |format|
         if @topic.update(topic_params)
            format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
            format.json { render :show, status: :ok, location: @topic }
         else
            format.html { render :edit }
            format.json { render json: @topic.errors, status: :unprocessable_entity }
         end
      end
      
   end
   
   private
   
   def set_topic
      @topic = Topic.find(params[:id])
   end
   
   def topic_params
      params.require(:topic).permit(:tittle)
   end
end
