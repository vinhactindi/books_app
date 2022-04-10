require 'rails_helper'

RSpec.describe 'Books', js: true, type: :system do
  fixtures :books

  let(:rails_book) { books(:rails) }

  it 'visiting the index' do
    visit books_url
    expect(page).to have_selector('h1', text: 'Books')
  end

  it 'creating a Book' do
    visit books_url
    click_on 'New Book'

    fill_in 'Memo', with: rails_book.memo
    fill_in 'Title', with: rails_book.title
    click_on 'Create Book'

    expect(page).to have_content('Book was successfully created')
    click_on 'Back'
  end

  it 'updating a Book' do
    visit books_url
    click_on 'Edit', match: :first

    fill_in 'Memo', with: rails_book.memo
    fill_in 'Title', with: rails_book.title
    click_on 'Update Book'

    expect(page).to have_content('Book was successfully updated')
    click_on 'Back'
  end

  it 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    expect(page).to have_content('Book was successfully destroyed')
  end
end
