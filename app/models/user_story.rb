# == Schema Information
#
# Table name: user_stories
#
#  id                        :integer          not null, primary key
#  descriptive_name          :text
#  estimated_completion_date :date
#  row_order                 :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  membership_id             :integer
#  milestone_id              :integer
#  project_id                :integer
#
class UserStory < ApplicationRecord
    belongs_to :milestone

    include RankedModel
    ranks :row_order, with_same: :milestone_id
end
