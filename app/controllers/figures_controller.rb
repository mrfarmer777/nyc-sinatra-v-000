require 'pry'
class FiguresController < ApplicationController
  get '/figures' do
    @figures=Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    binding.pry
    erb :'figures/new'
  end

  post '/figures' do

    @figure=Figure.create(params[:figure])
    if !params["title"]["name"]==[]
      binding.pry
      @title=Title.find_or_create_by(params["title"])
      @figure.titles<<@title
      @title.save
    end
    if !params['landmark']["name"]==[]
      @landmark=Landmark.find_or_create_by(params["landmark"])
      @figure.landmarks<<@landmark
      @landmark.save
    end
    @figure.save
    binding.pry

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
