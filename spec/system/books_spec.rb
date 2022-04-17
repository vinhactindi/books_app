require 'rails_helper'

RSpec.describe 'Books', js: true, type: :system do
  fixtures :books

  let(:rails_book) { books(:rails) }

  it 'enable me to visit index page' do
    visit books_path
    expect(page).to have_selector('h1', text: 'Books')
    expect(page).to have_text(rails_book.title)
  end

  it 'enable me to create a Book' do
    visit books_path
    click_on 'New Book'

    fill_in 'Memo', with: rails_book.memo
    fill_in 'Title', with: rails_book.title
    click_on 'Create Book'

    expect(page).to have_content('Book was successfully created')
    click_on 'Back'
  end

  it 'enable me to update a Book' do
    visit books_path
    click_on 'Edit', match: :first

    fill_in 'Memo', with: rails_book.memo
    fill_in 'Title', with: rails_book.title
    click_on 'Update Book'

    expect(page).to have_content('Book was successfully updated')
  end

  it 'enable me to destroy a Book' do
    visit books_path
    accept_confirm do
      click_on 'Destroy', match: :first
    end

    expect(page).to have_content('Book was successfully destroyed')
  end
end
