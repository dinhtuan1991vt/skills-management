# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create!(first_name: "John", sur_name: "Admin", email: "admin@localhost.com", password: "admin", password_confirmation: "admin", status: true)
admin.add_role :Admin

supervisor = User.create!(first_name: "Marry", sur_name: "Supervisor", email: "supervisor@localhost.com", password: "supervisor", password_confirmation: "supervisor", status: true)
supervisor.add_role :Supervisor

general_staff = User.create!(first_name: "Hank", sur_name: "General Staff", email: "general.staff@localhost.com", password: "generalstaff", password_confirmation: "generalstaff", status: true)
general_staff.add_role :GeneralStaff

SkillCategory.create!(name: :PHP)
SkillCategory.create!(name: :Ruby)

Skill.create!(name: :Linux,   description: "L in LAMP", skill_category_id: 1)
Skill.create!(name: :Apache,  description: "A in LAMP", skill_category_id: 1)
Skill.create!(name: :MySQL,   description: "M in LAMP", skill_category_id: 1)
Skill.create!(name: :PHP,     description: "P in LAMP", skill_category_id: 1)
Skill.create!(name: :Ruby,     description: "first R in ROR", skill_category_id: 2)
Skill.create!(name: :Rails,     description: "last R in ROR", skill_category_id: 2)

Team.create!(name: :JOTO)
Team.create!(name: :MyID)

Rank.create!(name: "Accountant")
Rank.create!(name: "General Manager")
Rank.create!(name: "Legal Counsel")
Rank.create!(name: "Senior Accountant")
Rank.create!(name: "Senior Legal Counsel")

Location.create!(name: "Ho Chi Minh", latitude: 10.8071409, longitude: 106.67040779999999)
Location.create!(name: "Hong Kong", latitude: 23.01478161775026, longitude: 114.09716561250002)
