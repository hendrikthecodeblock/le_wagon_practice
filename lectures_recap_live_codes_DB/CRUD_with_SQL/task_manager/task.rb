class Task
  attr_reader :title, :description, :id
  attr_accessor :done, :title

  def initialize(attributes = {})
    @id = attributes[:id]
    @title = attributes[:title]
    @description = attributes[:description]
    @done = attributes[:done] || false
  end

  def self.find(id)
    # find the record in the databse
    post = DB.execute("SELECT * FROM tasks WHERE id = ?", id)
    # return new task instance
    # return instance of Post
    Task.new(id: task["id"], title: task["title"], description: task["description"], done: task["done"])
  end

  def save
    if @id.nil?
      DB.execute("INSERT INTO tasks (title, description) VALUES (?, ?, ?)", @title, @description, @done)
      #update the id to the id from DB
      @id = DB.last_insert_row_id
    else
      DB.execute("UPDATE tasks SET title = ?, description = ?, done = ?
      WHERE id = ?", @title, @description, @done == true ? 1 : 0, @id)
    end
  end

  def self.all
    # grab all tasks from DB
     tasks = DB.execute("SELECT * FROM tasks")
     tasks.map do |task|
      Task.new(id: task["id"], title: task["title"], description: task["description"], done: task["done"])
     end
  end

  def destroy
    DB.execute("DELETE FROM tasks WHERE id = ?", @id)
  end
end
