require 'rails_helper'

describe 'todos' do

  it 'adds a new todo to the list' do
    visit todos_path
    find("#new-todo").set("Chores")
    click_on 'Save'
    expect(current_path).to eq '/todos'
    expect(page).to have_content "Chores"
  end

  it 'deletes a todo from the list' do
    create_new_todo("my first todo")
    within all(".todo").last do
      click_on("X")
    end
    expect(page).to_not have_content "my first todo"
  end

  it 'edits a todo in the list' do
    create_new_todo("change me")
    click_on("change me")
    find(".edit").set("new idea")
    click_on("Save")

    expect(current_path).to eq todos_path
    expect(page).to_not have_content "change me"
    expect(page).to have_content "new idea"
  end

  it 'is grayed out when marked as completed: true' do
    create_new_todo("i will do this now")
    click_on(".complete")
  end
  private

  def create_new_todo(name)
    visit todos_path
    find("#new-todo").set(name)
    click_on 'Save'
    expect(page).to have_content name 
  end

end
