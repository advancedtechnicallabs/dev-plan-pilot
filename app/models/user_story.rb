# == Schema Information
#
# Table name: user_stories
#
#  id                        :integer          not null, primary key
#  descriptive_name          :text
#  estimated_completion_date :date
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  membership_id             :integer
#  milestone_id              :integer
#  project_id                :integer
#
class UserStory < ApplicationRecord
    belongs_to :milestone
end
