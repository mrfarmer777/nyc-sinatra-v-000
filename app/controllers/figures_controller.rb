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
    binding.pry
    @figure=Figure.create(params[:figure])
    if !params["title"]["name"]==nil
      @title=Title.find_or_create_by(params["title"])
      @figure.titles<<@title
      @title.save
    end
    if !params['landmark']["name"]==nil
      @landmark=Landmark.find_or_create_by(params["landmark"])
      @figure.landmarks<<@landmark
      @landmark.save
    end
    @figure.save

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
