def nyc_pigeon_organizer(data)
  # get all people, combine and uniq them
  people = data.flat_map {|label, category|
    category.flat_map {|value, names| names}
  }.uniq
  people.map {|name|
    [name, {
      :color => data[:color].reduce([]) {|matching_people, (color_label, people)|
        matching_people << name if people.includes? name
        matching_people
      }
    }]
  }.to_h
end

def find_matches data, key
  data[:color].reduce([]) {|matching_people, (color_label, people)|
    matching_people << name if people.includes? name
    matching_people
  }
end
