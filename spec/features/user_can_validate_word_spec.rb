require 'rails_helper'

describe 'a user visits the main page' do
  context 'a user can enters a valid word into a form' do
    it 'the user can validate the word' do
#       Background:
# * This story should use the Oxford Dictionaries API https://developer.oxforddictionaries.com/documentation
# * Use endpoint "GET /inflections/{source_lang}/{word_id}" under the "Lemmatron" heading
      visit "/"

      fill_in 'enter_word', :with => 'foxes'

      click_on("Validate Word")

      expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
    end
  end
  context 'a user can enters a non-valid word into a form' do
    it 'the user can determine the word is not valid' do

      visit "/"

      fill_in 'enter_word', :with => 'foxez'

      click_on("Validate Word")

      expect(page).to have_content("'foxez' is not a valid word.")
    end
  end
end
