require 'pry'
class FiguresController < ApplicationController
  get '/figures' do
    @figures=Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    

    @figure=Figure.create(params[:figure])
    @figure.save
    #params["figure"]["landmark_ids"].each {|id| Landmark.find(id).figure_id=@figure.id}
    #params["figure"]["title_ids"].each {|id| FigureTitle.create(title_id:id, figure_id:@figure.id)}
    #binding.pry
  end

  get '/figures/:id' do
    @figure=Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure=Figure.find(params[:id])
    erb :'figures/edit'
  end



end
