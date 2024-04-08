# == Schema Information
#
# Table name: issues
#
#  id                     :integer          not null, primary key
#  description            :text
#  resolution_explanation :text
#  status                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  task_id                :integer
#
class Issue < ApplicationRecord
end
