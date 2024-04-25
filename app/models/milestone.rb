# == Schema Information
#
# Table name: milestones
#
#  id                        :integer          not null, primary key
#  descriptive_name          :text
#  estimated_completion_date :date
#  estimated_start_date      :date
#  milestone_cost            :decimal(, )
#  row_order                 :integer
#  status                    :text
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  project_id                :integer
#
class Milestone < ApplicationRecord
    belongs_to :project
    has_many :user_stories

    include RankedModel
    ranks :row_order
end
