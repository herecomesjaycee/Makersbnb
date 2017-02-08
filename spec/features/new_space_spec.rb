require_relative '../spec_helper.rb'

feature 'adding new space' do
  scenario 'user can list a new space' do
    sign_up
    sign_in
    list_space
    expect(page.current_path).to eq '/spaces'
    expect(Space.first.name).to eq("Bob\'s villa")
  end

  scenario 'user cannot list a space with incorrect details' do
    sign_up
    sign_in
    list_space(price: 'Bob\'s Villa')
    expect(page.current_path).to eq '/spaces/new'
    list_space(available_start_date: 'Bob\'s Villa')
    expect(page.current_path).to eq '/spaces/new'
    list_space(available_end_date: 1000)
    expect(page.current_path).to eq '/spaces/new'
  end
end
