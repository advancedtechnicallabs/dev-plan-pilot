# == Schema Information
#
# Table name: milestones
#
#  id                        :integer          not null, primary key
#  descriptive_name          :text
#  estimated_completion_date :date
#  status                    :text
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  project_id                :integer
#
class Milestone < ApplicationRecord
end
