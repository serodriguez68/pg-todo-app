class Item < ActiveRecord::Base
  belongs_to :list

# Validations
    validates :content, presence:  {message: 'A content is required for the item'}
    validates :content, length: {
        in: 4..50,
        too_short: 'The content must have at least 4 characters',
        too_long: 'The content must have less than 50 characters'
    }
    validates :list, presence: {message: 'The item must belong to a list'}

end
