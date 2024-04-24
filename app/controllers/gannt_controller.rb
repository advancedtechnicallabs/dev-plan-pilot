class GanntController < ApplicationController

  def index  
  end


  def data

    milestone_data = Milestone.all
    
    render :json=> {
      :data => milestone_data.map{|data|{
        :id => data.id,
        :text => data.descriptive_name,
        :start_date => Date.today.strftime("%d/%m/%Y"),
        :duration => (data.estimated_completion_date - Date.today).to_i,
        :progress => 1,
        :open => true
      }}
    }

  end

end # Of Home controller class
