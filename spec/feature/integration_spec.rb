# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
    scenario 'valid inputs' do
        visit new_book_path
        fill_in 'Title', with: 'harry potter'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('harry potter')
    end
    scenario 'valid author' do
        visit new_book_path
        fill_in 'Title', with: 'harry potter'
        fill_in 'Author', with: 'jk rowling'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('jk rowling')
    end
    scenario 'valid price' do
        visit new_book_path
        fill_in 'Title', with: 'harry potter'
        fill_in 'Price', with: '9.99'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('9.99')
    end
    scenario 'valid date' do
        visit new_book_path
        fill_in 'Title', with: 'harry potter'
        fill_in 'Date Published', with: '2001-1-1'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('2001-1-1')
    end
end