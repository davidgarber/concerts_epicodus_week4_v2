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

  describe('the venues path') do
    it('visits the index') do
      visit('/')
      click_link('Go to the venues list')
      fill_in('name', with: 'Roseland')
      click_button('Submit')
      expect(page).to have_content('Roseland')
    end
  end

  describe('the venue detail') do
    it('visits the index') do
      visit('/')
      click_link('Go to the venues list')
      fill_in('name', with: 'Roseland')
      click_button('Submit')
      click_link('Roseland')
      expect(page).to have_content('Roseland')
    end
  end

  describe('update the band') do
    it('visits the index') do
      visit('/')
      click_link('Go to the bands list')
      fill_in('name', with: 'Beyonce')
      click_button('Submit')
      click_link('Beyonce')
      fill_in('name', with: 'Beyonces')
      click_button('Submit')
      expect(page).to have_content('Beyonces')
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

  describe('adding a band to a venue') do
    it('visits the index') do
      visit('/')
      click_link('Go to the venues list')
      fill_in('name', with: 'Beyonce')
      click_button('Submit')
      expect(page).to have_content('Beyonce')
    end
  end
end
