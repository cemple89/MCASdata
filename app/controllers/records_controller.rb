class RecordsController < ApplicationController

  def index
    @records = Record.order(:StudentLocalID)

    respond_to do |format|
      format.html
      format.csv { send_data @records.to_csv, filename: "mcas-records.csv" }
    end
  end
end
