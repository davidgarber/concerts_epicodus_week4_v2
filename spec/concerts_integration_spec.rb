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
      fill_in('name', with: 'Ike and Tina Turner')
      click_button('Submit')
      click_link('Ike and Tina Turner')
      fill_in('name', with: 'Tina Turner')
      click_button('Submit')
      expect(page).to have_content('Tina Turner')
    end
  end
end
