class List < ActiveRecord::Base

    # Validations
    validates :title, presence:  {message: 'A title is required for the list'}
    validates :title, length: {
        in: 5..30,
        too_short: 'The title must have at least 5 characters',
        too_long: 'The title must have less than 30 characters'
    }


    validates :description, presence:  {message: 'A description is required for the list'}
    validates :description, length: {
        in: 10..60,
        too_short: 'The description must have at least 10 characters',
        too_long: 'The description must have less than 60 characters'
    }

end
