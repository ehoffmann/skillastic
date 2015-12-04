# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

[
  "Ability to focus",
  "Ability to handle Change",
  "Academics",
  "Accounting",
  "Adaptability",
  "Advertising",
  "Affiliate systems",
  "Analyzing the past",
  "Art",
  "Articulate",
  "Athleticism",
  "Awareness",
  "Bookkeeping",
  "Brainstorming",
  "Communication Skills",
  "Computer Literacy",
  "Computers / IT",
  "Conflict Resolution",
  "Creativity",
  "Critical Thinking",
  "Decision Making",
  "Detail Orientation",
  "Dexterity",
  "Drawing",
  "Empathy",
  "Encouraging",
  "Fairness",
  "Financial Management",
  "Foreign Language",
  "Future Thinking",
  "Futuristic",
  "Graphics",
  "Guerrilla Marketing",
  "Health / Fitness",
  "Hiring / Recruiting",
  "Human Resources",
  "Imagination",
  "Imaginative",
  "Initiative",
  "Innovation",
  "Inspiring",
  "Integrity / Honesty",
  "Intuition",
  "Jokes / Humor",
  "Juggling",
  "Leadership",
  "Learner",
  "Legal",
  "Listening",
  "Magic",
  "Maintenance / Routine Tasks",
  "Making Connections",
  "Marketing",
  "Math",
  "Meeting management",
  "Music",
  "Negotiating Skills",
  "Networking (dirt - person to person)",
  "Networking (virtual world)",
  "People Judgment",
  "Persuasive",
  "Photography",
  "Planning",
  "Polyglot (learn/know a many languages)",
  "Positiveness",
  "Problem Solving",
  "Programming",
  "Project Management",
  "Reading",
  "Relaxation",
  "Research",
  "Sales",
  "Self Control",
  "Self Management",
  "Self-Assurance",
  "Self-Discipline",
  "Sign Language",
  "Social Intelligence",
  "Software",
  "Story Telling",
  "Systems management",
  "Taxes",
  "Teaching  / Training",
  "Trouble-shooter",
  "Typing",
  "Video Creation",
  "Visualization",
  "Website",
  "Wisdom",
  "Woodworking",
  "Writing",
].each do |skill|
  Skill.create!(name: skill)
end

generator = Namey::Generator.new

ActiveRecord::Base.transaction do
  # Create workers
  1000.times do |i|
    puts "Create worker #{i+1}"
    first_name, last_name = generator.name.split
    w = Worker.create!(first_name: first_name, last_name: last_name, email: "#{i+1}@test.com", password: "12345678")

    # Add radom skills
    rand(1..5).times do |j|
      w.skills << Skill.limit(5).order("RANDOM()").reject{ |skill| w.skills.include?(skill) }.first
    end
  end

  # Create customers
  4000.times do |i|
    puts "Create customer #{i+1}"
    first_name, last_name = generator.name.split
    Customer.create!(first_name: first_name, last_name: last_name, email: "#{i+1}@test.com", password: "12345678")
  end
end
