# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161115162932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "records", force: :cascade do |t|
    t.string  "NCESID",            default: "373737"
    t.string  "StudentLocalID",    default: "missing"
    t.string  "StudentTestID"
    t.integer "StudentGradeLevel"
    t.string  "TestDate"
    t.string  "TestName",          default: "MCAS"
    t.string  "TestTypeName"
    t.string  "TestSubjectName"
    t.integer "TestGradeLevel"
    t.string  "Score1Label",       default: "Performance Level"
    t.string  "Score1Type",        default: "Level"
    t.string  "Score1Value"
    t.string  "Score2Label",       default: "Scaled Score"
    t.string  "Score2Type",        default: "Scale"
    t.string  "Score2Value"
    t.string  "Score3Label",       default: "CPI"
    t.string  "Score3Type",        default: "Scale"
    t.string  "Score3Value"
  end

end
