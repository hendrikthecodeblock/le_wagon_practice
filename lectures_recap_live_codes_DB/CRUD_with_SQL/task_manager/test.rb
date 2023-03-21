require "sqlite3"
DB = SQLite3::Database.new("tasks.db")
DB.results_as_hash = true
require_relative "task"

DB = SQLlite3::Database.new("tasks.db")
DB.results_as_hash = true
require_relative 'task'

# Implement the READ logic to find a given task (by its id)
task = Task.find(1)
puts "Task #{task.title}"

# Implement the CREATE logic in a save instance method
laundry = Task.new(title: "Do laundry", description: "Urgent")
laundry.id = # nil
laundry.save

# Implement the UPDATE logic in the same method

task.done = true
task.title = 'Livecode'
task.save # title will be updated to Livecode

# Destroy Tasks
task.destroy
