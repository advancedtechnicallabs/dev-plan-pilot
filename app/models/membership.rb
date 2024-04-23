# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  role       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :integer
#  user_id    :integer
#
class Membership < ApplicationRecord
    belongs_to :user
    belongs_to :project
    has_many :user_stories
end
