File.open('list', 'w') do |f|
    50_000_000.times do |i|
    f << "some_key#{i}\n"
  end
end

# `time rg some_key49995724`
# ~ 739ms
