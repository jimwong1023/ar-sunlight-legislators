require 'csv'
require_relative 'app/models/legislators'

def pol_by_state(state = '', title = '')
  puts "#{state} #{title}:"
  Legislator.where(state: state, title: title).sort.each do |pol|
    puts "  #{pol[:firstname]} #{pol[:lastname]} (#{pol[:party]})"
  end
end

def gender_by_title(gender = '', title = '')
  pols_by_sex_title = Legislator.where(gender: gender, title: title).length
  total_pols_by_title = Legislator.where(title: title).length.to_f

  if gender == "M"
    sex = "Male"
  else
    sex = "Female"
  end

  puts "#{sex} #{title}: #{pols_by_sex_title} (#{((pols_by_sex_title/total_pols_by_title)*100).to_i}%)"
end

def state_pols
  active_pols = Legislator.where(in_office: "1")

  active_pols.each do |pol|
    
  end

end

pol_by_state('CA', 'Sen')
pol_by_state('CA', 'Rep')
gender_by_title("M", "Rep")