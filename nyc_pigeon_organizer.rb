def nyc_pigeon_organizer(data)
  # get all people, combine and uniq them
  people = data.flat_map {|label, category|
    category.flat_map {|value, names| names}
  }.uniq
  people.map {|name|
    [name, {
      :color => find_matches(data, :color, name),
      :gender => find_matches(data, :gender, name),
      :lives => find_matches(data, :lives, name)
    }]
  }.to_h
end

def find_matches data, key, name
  data[key].reduce([]) {|matching_people, (label, people)|
    matching_people << label if people.include? name
    matching_people.uniq
  }
end
