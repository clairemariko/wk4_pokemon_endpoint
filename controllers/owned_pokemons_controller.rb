require_relative('../models/pokemon.rb')
require_relative('../models/trainer.rb')
require_relative('../models/owned_pokemon.rb')

get '/owned_pokemons/new' do
  #NEW
  @pokemons = Pokemon.all
  @trainers = Trainer.all
  erb :"owned_pokemons/new"
end

post '/owned_pokemons' do
  @owned_pokemon = OwnedPokemon.new(params)
  @owned_pokemon.save()
end

get '/owned_pokemons' do
  @owned_pokemons = OwnedPokemon.all
  erb :"owned_pokemons/index"
end