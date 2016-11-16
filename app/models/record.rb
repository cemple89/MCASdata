class Record < ActiveRecord::Base


  def self.to_csv
    attributes = %w{NCESID StudentLocalID StudentTestID StudentGradeLevel TestDate TestName TestTypeName TestSubjectName TestGradeLevel Score1Label Score1Type Score1Value Score2Label Score2Type Score2Value Score3Label Score3Type Score3Value}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |record|
        csv << attributes.map { |attr| record.send(attr) }
      end
      
    end
  end
end
