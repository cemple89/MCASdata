require 'csv'
require 'pry'
namespace :import do

  desc "Import record from csv"
  task records: :environment do
    records = File.join Rails.root, "sample-mcas.csv"
    counter = 0

    CSV.foreach(records, headers: true) do |row|
      @studenttestid = row["sasid"]
      @studentgradelevel = row["stugrade"]
      @elascaled = row["escaleds"]
      @mathscaled = row["mscaleds"]
      @sciscaled = row["sscaleds"]
      @elacpi = row["ecpi"]
      @mathcpi = row["mcpi"]
      @scicpi = row["scpi"]

      if row["eperf2"] == "F"
        @elaplevel = "1-F"
      elsif row["eperf2"] == "W"
        @elaplevel = "2-W"
      elsif row["eperf2"] == "NI"
        @elaplevel = "3-NI"
      elsif row["eperf2"] == "P"
        @elaplevel = "4-P"
      elsif row["eperf2"] == "A"
        @elaplevel = "5-A"
      elsif row["eperf2"] == "P+"
        @elaplevel = "6-P+"
      end

      if row["mperf2"] == "F"
        @mathplevel = "1-F"
      elsif row["mperf2"] == "W"
        @mathplevel = "2-W"
      elsif row["mperf2"] == "NI"
        @mathplevel = "3-NI"
      elsif row["mperf2"] == "P"
        @mathplevel = "4-P"
      elsif row["mperf2"] == "A"
        @mathplevel = "5-A"
      elsif row["mperf2"] == "P+"
        @mathplevel = "6-P+"
      end

      if row["sperf2"] == "F"
        @sciplevel = "1-F"
      elsif row["sperf2"] == "W"
        @sciplevel = "2-W"
      elsif row["sperf2"] == "NI"
        @sciplevel = "3-NI"
      elsif row["sperf2"] == "P"
        @sciplevel = "4-P"
      elsif row["sperf2"] == "A"
        @sciplevel = "5-A"
      elsif row["sperf2"] == "P+"
        @sciplevel = "6-P+"
      elsif row["sperf2"] == nil
        @sciplevel = nil
      end

      @elarecord = Record.create(
      TestSubjectName: "ELA",
      TestDate: "April 1",
      TestTypeName: "MCAS ELA",
      Score1Value: @elaplevel,
      Score2Value: @elascaled,
      Score3Value: @elacpi,
      StudentTestID: @studenttestid,
      StudentGradeLevel: @studentgradelevel,
      TestGradeLevel: @studentgradelevel
      )

      @mathrecord = Record.create(
      TestSubjectName: "Math",
      TestDate: "May 1",
      TestTypeName: "MCAS Math",
      Score1Value: @mathplevel,
      Score2Value: @mathscaled,
      Score3Value: @mathcpi,
      StudentTestID: @studenttestid,
      StudentGradeLevel: @studentgradelevel,
      TestGradeLevel: @studentgradelevel
      )

      @sciencececord = Record.create(
      TestSubjectName: "Science",
      TestDate: "June 1",
      TestTypeName: "MCAS Science",
      Score1Value: @sciplevel,
      Score2Value: @sciscaled,
      Score3Value: @scicpi,
      StudentTestID: @studenttestid,
      StudentGradeLevel: @studentgradelevel,
      TestGradeLevel: @studentgradelevel
      )

      if @elarecord.persisted?
        counter += 1
      end

      if @mathrecord.persisted?
        counter += 1
      end

      if @sciencececord.persisted?
        counter += 1
      end

    end
    puts "#{counter} records imported."
  end
end
