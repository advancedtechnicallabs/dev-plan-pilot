# == Schema Information
#
# Table name: projects
#
#  id                        :integer          not null, primary key
#  budget_amount             :decimal(, )
#  estimated_completion_date :date
#  project_description       :text
#  project_name              :string
#  skillset_requirements     :text
#  status                    :string
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
class Project < ApplicationRecord
end
