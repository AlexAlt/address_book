require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the contacts list homepage path', {:type => :feature}) do
  it('allows user to add a new contact') do
    visit('/')
    fill_in('first_name', :with => "Alex")
    fill_in('last_name', :with => "Altieri")
    fill_in('job', :with => "Human")
    fill_in('company', :with => "Universe")
    click_button('Submit')
    expect(page).to have_content("Alex")
  end
end

describe('the path to list of contact info', {:type => :feature}) do
  it('list the contact information for specific contact') do
    visit('/all_contacts')
    click_link('Alex Altieri')
    expect(page).to have_content("860")
  end
end

describe('the path to email form', {:type => :feature}) do
  it('creates a form to enter a new email address') do
    visit('/contact/:id/')
    click_link('Add an email address')
    expect(page).to have_content("Email form")
  end
end
