class School < ActiveRecord::Base
  after_save :generate_pupil

  belongs_to :user
  has_many :pupils

  def generate_pupil
    @names = %w{Bojan Nemanja Stefan Ilija Dragan Boba Goci Ipce}
    @surnames = %w{Pleb Milic Dragic Radic Gut Sobic}
    @sex = %w{M F}
    rand(90..110).times do
      @pupil = pupils.build
      @pupil.first_name = @names.sample
      @pupil.last_name = @surnames.sample
      @pupil.gender = @sex.sample
      @pupil.save
    end
  end
    def sort_pupils
      @pupils = pupils.all
      #debugger
      @males = @pupils.select{|p| p.gender == 'M'}
      @females = @pupils.select{|k| k.gender == 'F'}
      @males_div = @males.each_slice(@males.length/num_of_grades).to_a
      @females_div = @females.each_slice(@females.length/num_of_grades).to_a
      for i in 0..num_of_grades-1 do
        @males_div[i].each{|m| m.grade = i+1; m.save}
        @females_div[i].each{|m| m.grade = i+1; m.save}
      end
    end
end
