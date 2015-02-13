require 'rails_helper'

describe 'Todo' do

  it 'is valid' do
    todo = Todo.new(name: "first idea")
    expect(todo).to be_valid
  end

  it 'is invalid without a name' do
    todo = Todo.new(name: "")
    expect(todo).to be_invalid
  end

  it 'is invalid if name is not unique' do
    todo = Todo.create(name: "unoriginal")
    expect(todo).to be_valid

    next_todo = Todo.create(name: "unoriginal")
    expect(next_todo).to be_invalid
  end

  it 'it is not completed by default' do
    todo = Todo.create(name: "chore")
    expect(todo.completed).to be_falsey
  end
end
