# www.airbnb.com/flats/52
# www. github.com/users/Mim1991
# # Read All
# SELECT * FROM flats

# # Read One
# SELECT * FROM flats
# WHERE id = 52

# SELECT * FROM users
# WHERE username = "Mim1991"

# # Create

# INSERT INTO doctors (name, age, specialty)
# VALUES ('Jerry', 40, 'GP')

# # Update

# UPDATE doctors SET age = 30, specialty = 'Cardiologist'
# WHERE id = 4
# Can update multiple columns by adding,
# UPDATE doctors SET age = 30, name = 'Chris' WHERE id = 3

# # delete

# DELETE from doctors
# WHERE id = 3

# DELETE FROM photos [Will delete all rows]

require 'sqlite3'

DB = SQLite3::Database.new("02_sql_crud_doctors.db")

class Doctor
  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @age = attributes[:age]
    @specialty = attributes[:specialty]
  end

  def save
    query = <<~SQL
      INSERT INTO doctors (name, age, specialty)
      VALUES (?, ?, ?)
    SQL
    DB.execute(query, @name, @age, @specialty)
    @id = DB.last_insert_row_id
  end
end

hendrik = Doctor.new(name: 'hendrik', age: 42, specialty: 'GP')
hendrik.save
March = Doctor.new(name: 'March', age: 40, specialty: 'Psychology')
March.save

def all
  query = <<~SQL
  SELECT *
  FROM doctors
  SQL
  DB.results_as_hash = true
  doctors = DB.execute(query)
end
