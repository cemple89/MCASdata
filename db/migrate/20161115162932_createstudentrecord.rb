class Createstudentrecord < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.string :NCESID, default: "373737"
      t.string :StudentLocalID, default: "missing"
      t.string :StudentTestID
      t.integer :StudentGradeLevel
      t.string :TestDate
      t.string :TestName, default: "MCAS"
      t.string :TestTypeName
      t.string :TestSubjectName
      t.integer :TestGradeLevel
      t.string :Score1Label, default: "Performance Level"
      t.string :Score1Type, default: "Level"
      t.string :Score1Value
      t.string :Score2Label, default: "Scaled Score"
      t.string :Score2Type, default: "Scale"
      t.string :Score2Value
      t.string :Score3Label, default: "CPI"
      t.string :Score3Type, default: "Scale"
      t.string :Score3Value
    end
  end
end
