def nyc_pigeon_organizer(data)
  # get all people, combine and uniq them
  data.flat_map {|label, category|
    category.flat_map {|value, names| names}
  }
end
