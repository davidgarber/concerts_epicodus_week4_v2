require('spec_helper')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('The app', :type => :feature) do
  describe('the root path') do
    it('visits the index') do
      visit('/')
      expect(page).to have_content('Concerts')
    end
  end

  describe('the bands path') do
    it('visits the index') do
      visit('/')
      click_link('Go to the bands list')
      fill_in('name', with: 'Jay-Z')
      click_button('Submit')
      expect(page).to have_content('Jay-Z')
    end
  end

  describe('the band detail') do
    it('visits the index') do
      visit('/')
      click_link('Go to the bands list')
      fill_in('name', with: 'Jay-Z')
      click_button('Submit')
      click_link('Jay-Z')
      expect(page).to have_content('Jay-Z')
    end
  end
end
