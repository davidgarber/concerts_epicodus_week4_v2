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
