def nyc_pigeon_organizer(data)
  # get all people, combine and uniq them
  people = data.flat_map {|label, category|
    category.flat_map {|value, names| names}
  }.uniq
  people.map {|name|
    [name, {
      :color => find_matches(data, :color),
      :gender => find_matches(data, :gender),
      :lives => find_matches(data, :lives)
    }]
  }.to_h
end

def find_matches data, key, name
  data[key].reduce([]) {|matching_people, (color_label, people)|
    matching_people << name if people.includes? name
    matching_people
  }
end
