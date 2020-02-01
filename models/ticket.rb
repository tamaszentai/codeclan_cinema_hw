require('PG')
require_relative('../db/sql_runner')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options ['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @film_id]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all()
   sql = "SELECT * FROM tickets"
   tickets = SqlRunner.run(sql)
   result = tickets.map {|ticket| Ticket.new(ticket)}
   return result
 end

 def self.delete_all()
   sql = "DELETE FROM tickets"
   SqlRunner.run(sql)
 end

 def customer()
   sql = "SELECT * FROM customers
   WHERE id = $1"
   values = [@customer_id]
   customer = SqlRunner.run(sql, values).first
   return Customer.new(customer)
 end

 def film()
   sql = "SELECT * FROM films
   WHERE id = $1"
   values = [@film_id]
   film = SqlRunner.run(sql, values).first
   return Film.new(film)
 end
end
