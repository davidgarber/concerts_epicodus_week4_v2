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
      fill_in('name', with: 'Beyonce')
      click_button('Submit')
      expect(page).to have_content('Beyonce')
    end
  end

  describe('the band detail') do
    it('visits the index') do
      visit('/')
      click_link('Go to the bands list')
      fill_in('name', with: 'Beyonce')
      click_button('Submit')
      click_link('Beyonce')
      expect(page).to have_content('Beyonce')
    end
  end

  describe('update the band') do
    it('visits the index') do
      visit('/')
      click_link('Go to the bands list')
      fill_in('name', with: 'Beyonce')
      click_button('Submit')
      click_link('Beyonce')
      fill_in('new_name', with: 'Jay')
      click_button('Update')
      expect(page).to have_content('Jay')
    end
  end

  describe('delete the band') do
    it('visits the index') do
      visit('/')
      click_link('Go to the bands list')
      fill_in('name', with: 'Beyonce')
      click_button('Submit')
      click_link('Beyonce')
      click_button('Delete this band')
      expect(page).to have_content('')
    end
  end

  describe('adding a venue to a band') do
    it('visits the index') do
      visit('/')
      click_link('Go to the bands list')
      fill_in('name', with: 'Roseland')
      click_button('Submit')
      expect(page).to have_content('Roseland')
    end
  end
end
