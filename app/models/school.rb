class School < ActiveRecord::Base
  after_save :generate_pupil

  belongs_to :user
  has_many :pupils

  private
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
    sort_pupils
  end
    def sort_pupils
      @pupils = pupils.all
      #debugger
      @males = @pupils.select{|p| p.gender == 'M'}
      @females = @pupils.select{|k| k.gender == 'F'}
      @males_div = @males.each_slice(@males.length/3).to_a
        @males_div[0].each{|m| m.grade = 1; m.save}
        @males_div[1].each{|m| m.grade = 2; m.save}
        @males_div[2].each{|m| m.grade = 3; m.save}
      @females_div = @females.each_slice(@females.length/3).to_a
        @females_div[0].each{|m| m.grade = 1; m.save}
        @females_div[1].each{|m| m.grade = 2; m.save}
        @females_div[2].each{|m| m.grade = 3; m.save}
    end
end
