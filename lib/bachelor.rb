require 'pry'

def get_first_name_of_season_winner(data, season)
  arr = data[season]
  arr.find do |participant_hash|
    participant_hash["status"] = "Winner"
    w = participant_hash["name"].split(" ")
    return w[0]
  end
end

def get_contestant_name(data, occupation)
  data.each do |show, all_array|
    all_array.each do |participant_hash|
      if participant_hash["occupation"] == occupation
        return participant_hash["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0

  data.each do |show, all_array|
    all_array.each do |participant_hash|
      if participant_hash["hometown"] == hometown
        counter += 1
      end
    end
  end
  return counter
end

def get_occupation(data, hometown)
  data.each do |show, all_array|
    all_array.each do |participant_hash|
      if participant_hash["hometown"] == hometown
        return participant_hash["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  arr_age = []
  data.each do |show, all_array|
    if show == season
      all_array.each do |participant_hash|
        arr_age << participant_hash["age"].to_i
      end
    end
  end
  arr_age
  binding.pry
  arr_age.inject{ |sum, el| sum + el } / arr_age.size
end
