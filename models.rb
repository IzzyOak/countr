require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'countr.sqlite3'
)

class Counter < ActiveRecord::Base
  def as_json
    {id: id, name: name, count: count}
  end
end