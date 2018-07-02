class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks=Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    #?Why's it gotta be a hash here? vvv
    @landmark=Landmark.create(name:params["landmark"]["name"],year_completed:params["landmark"]["year_completed"])
    @landmark.save
    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark=Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark=Landmark.find(params[:id])
    erb :'landmarks/edit'
  end




end
