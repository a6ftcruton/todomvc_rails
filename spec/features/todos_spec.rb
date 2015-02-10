require 'rails_helper'

describe 'todos' do

  it 'adds a new todo to the list' do
    visit '/todos'
    fill_in '#new-todo', with: "Chores"
    click_on 'Save'
    expect(current_path).to eq '/todos'
    expect(page).to have_content "Chores"
  end

end
