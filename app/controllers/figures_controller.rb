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
    if !params["title"]["name"]==nil
      @title=Title.create(name:params["title"]["name"])
      @figure.titles<<@title
    end
    if !params['landmark']["name"]==nil
      @landmark=Landmark.create(name:params["landmark"]["name"])
      @figure.landmarks<<@landmark
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
