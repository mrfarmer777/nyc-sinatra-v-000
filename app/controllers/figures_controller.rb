class FiguresController < ApplicationController
  get '/figures' do
    @figures=Figure.all
    erb :'figures/index'
  end

  get 'figuress/new' do
    erb :'figures/new'
  end

  post '/figures' do
    #?Why's it gotta be a hash here? vvv
    @figure=figure.create(name:params["figure"]["name"])
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure=figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure=figure.find(params[:id])
    erb :'figures/edit'
  end



end
