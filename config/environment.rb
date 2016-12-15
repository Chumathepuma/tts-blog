# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Add created on datetime format
Time::DATE_FORMATS[:created_on] = "%B %d at %I:%M %p"