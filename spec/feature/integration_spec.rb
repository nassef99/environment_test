# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
    scenario 'valid inputs' do
        visit new_book_path
        fill_in 'Title', with: 'harry potter'
        fill_in 'Author', with: 'jk rowling'
        fill_in 'Price', with: '1'
        select '2022', :from => 'book_date_published_1i'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('harry potter')
    end
    scenario 'valid author' do
        visit new_book_path
        fill_in 'Title', with: 'harry potter'
        fill_in 'Author', with: 'jk rowling'
        fill_in 'Price', with: '1'
        select '2022', :from => 'book_date_published_1i'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('jk rowling')
    end
    scenario 'valid price' do
        visit new_book_path
        fill_in 'Title', with: 'harry potter'
        fill_in 'Author', with: 'jk rowling'
        fill_in 'Price', with: '1'
        select '2022', :from => 'book_date_published_1i'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('1')
    end
    scenario 'valid date' do
        visit new_book_path
        fill_in 'Title', with: 'harry potter'
        fill_in 'Author', with: 'jk rowling'
        fill_in 'Price', with: '1'
        select '2022', :from => 'book_date_published_1i'
        select 'January', :from => 'book_date_published_2i'
        select '1', :from => 'book_date_published_3i'
        click_on 'Create Book'
        visit books_path
        expect(page).to have_content('2022-01-01')
    end
end