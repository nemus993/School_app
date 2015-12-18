class School < ActiveRecord::Base


  belongs_to :user
  has_many :pupils

  def generate_pupil
    sex = %w{M F}
    rand(90..110).times do
      pupil = pupils.build
      pupil[:first_name] = Faker::Name.first_name
      pupil[:last_name] = Faker::Name.last_name
      pupil[:gender] = sex.sample
      pupil[:special] = false
      pupil.save
    end
  end
    def sort_pupils
      for i in 0..num_of_grades-1 do
        div_males[i].each{|m| m.grade = i+1; m.save}
        div_females[i].each{|m| m.grade = i+1; m.save}
      end
    end
  private
    def div_males
      males = pupils.all.select{|p| p.gender == 'M'}
      males.each_slice(males.length/num_of_grades).to_a
    end
    def div_females
      females = pupils.all.select{|p| p.gender == 'F'}
      females.each_slice(females.length/num_of_grades).to_a
    end
end
