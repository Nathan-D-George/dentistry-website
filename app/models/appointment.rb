class Appointment < ApplicationRecord
  belongs_to :user

  # make enum for app_type # enum app_type: %i[cleaning extraction root_canal orthodontion]
end
