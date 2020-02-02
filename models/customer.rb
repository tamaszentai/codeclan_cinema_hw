require('PG')
require_relative('../db/sql_runner')
require_relative('film')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return customers.map {|customer| Customer.new(customer)}
  end

  def update()
    sql = "UPDATE FROM customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    results = films.map {|film| Film.new(film)}
    return results
  end

  ### Basic extensions:
    # - Buying tickets should decrease the funds of the customer by the price
    # - Check how many tickets were bought by a customer
    # - Check how many customers are going to watch a certain film


  def buy_tickets(film)
    if @funds >= film.price
    @funds -= film.price
    return @funds
    else
      return "Insufficient funds!"
    end
  end

  def bought_tickets_number()
    return films.count
  end
end
