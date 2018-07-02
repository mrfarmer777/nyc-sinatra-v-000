class FiguresController < ApplicationController
  get '/figures' do
    @figures=Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    @titles=params["figure"]["titles"].collect{|id|Title.find(id)}
    @landmarks=params["figure"]["landmarks"].collect{|id|Landmark.find(id)}
    #?Why's it gotta be a hash here? vvv
    @figure=Figure.create(name:params["figure"]["name"])
    @figure.save
    redirect "/figures/#{@figure.id}"
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
