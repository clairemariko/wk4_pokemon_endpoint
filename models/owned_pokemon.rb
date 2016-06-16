require( 'pg' )
require_relative('../db/sql_runner')

class OwnedPokemon

  attr_reader :id, :trainer_id, :pokemon_id

  def initialize( options )
    @id = options['id'].to_i
    @trainer_id = options['trainer_id'].to_i
    @pokemon_id = options['pokemon_id'].to_i
  end

  def trainer()
    Trainer.find(@trainer_id)
    # sql = "SELECT * FROM Trainers where id = #{@trainer_id}"
    # Trainer.map_item(sql)
  end

  def pokemon()
    Pokemon.find(@pokemon_id)
    # sql = "SELECT * FROM Trainers where id = #{@trainer_id}"
    # Trainer.map_item(sql)
  end

  def save
    sql = "INSERT INTO OwnedPokemons (
      trainer_id,
      pokemon_id) 
      VALUES (
        #{ @trainer_id }, 
        #{ @pokemon_id }
      )"
    SqlRunner.run_sql( sql )
  end

  def self.all()
    sql = "SELECT * FROM OwnedPokemons"
    owned = SqlRunner.run_sql( sql )
    result = owned.map { |o| OwnedPokemon.new( o ) }
    return result
  end

  def self.delete_all 
    sql = "DELETE FROM OwnedPokemons"
    SqlRunner.run_sql(sql)
  end
  
end