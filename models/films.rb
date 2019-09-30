require_relative("./customer")
require_relative("../db/sql_runner")

class Film
  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
  end


#SAVE METHOD------------------------------------------
def save()
   sql = "INSERT INTO films
    (title, price) VALUES ($1, $2) RETURNING id"
   values = [@title, @price]
   film = SqlRunner.run(sql, values)[0];
   @id = film['id'].to_i
end

#UPDATE----------------------------------------------
def update()
  sql = "UPDATE films SET
  (title, price) = ($1, $2) WHERE id = $3"
  values = [@title, @price]
  SqlRunner.run(sql, values)
end

#DELETE----------------------------------------------
def delete()
  sql = "DELETE FROM films WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end


#CLASS METHODS----------------------------------------

def self.all()
  sql = "SELECT * FROM films"
  result = SqlRunner.run(sql)
  return result.map{|film| Film.new(film)}
end

def self.delete_all()
  sql = "DELETE FROM films"
  SqlRunner.run(sql)
end


end
