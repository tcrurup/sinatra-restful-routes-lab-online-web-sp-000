class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  
  get '/recipes/new' do
    erb :new
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end
  
  
  
  post '/recipes/new' do
    recipe = Recipe.create(params)
    redirect "recipies/#{recipe.id}"
  end

end
