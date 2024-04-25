class GanntController < ApplicationController

  def index  
  end


  def data

    milestone_data = Milestone.all
    
    
    render :json=> {
      :data => milestone_data.map{|data|{
        :id => data.id,
        :text => data.descriptive_name,
        :start_date => DateTime.civil(data.estimated_start_date.year, data.estimated_start_date.month, data.estimated_start_date.day, 0, 0, 0).to_formatted_s(:db),
        :duration => (data.estimated_completion_date - data.estimated_start_date).to_i,
        :progress => 1,
        :open => true
      }}
    }

  end

end # Of Home controller class
