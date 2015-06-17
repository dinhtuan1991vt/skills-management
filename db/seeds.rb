# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.create!(first_name: "Admin", sur_name: "admin", email: "admin@localhost.com", password: "admin", password_confirmation: "admin", status: true)
admin.add_role :admin

user = User.create!(first_name: "Admin", sur_name: "admin", email: "user@localhost.com", password: "user", password_confirmation: "user", status: true)
user.add_role :user

SkillCategory.create!(name: :PHP)
SkillCategory.create!(name: :Ruby)

Skill.create!(name: :Linux,   description: "L in LAMP", skill_category_id: 1)
Skill.create!(name: :Apache,  description: "A in LAMP", skill_category_id: 1)
Skill.create!(name: :MySQL,   description: "M in LAMP", skill_category_id: 1)
Skill.create!(name: :PHP,     description: "P in LAMP", skill_category_id: 1)