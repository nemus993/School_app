require 'faker'

FactoryGirl.define do
  factory :school do |f|
    f.title "Skola"
    f.num_of_grades {rand(1..10)}
    association :user_id, factory: :user
  factory :school_with_pupils, :parent => :school do
    after(:create) do |s|
    rand(90..110).times do
      create(:pupil, school: s)
    end
    end
  end
  end
  factory :user do |f|
    f.email {Faker::Internet.email}
    f.password "nemanja1234"
  end
  factory :pupil do |p|
    p.first_name {Faker::Name.first_name}
    p.last_name {Faker::Name.last_name}
    p.gender {%w{M F}.sample}
    p.grade {rand(1..10)}
  end
end
