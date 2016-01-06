arr = [1,2,3]

arr.each_with_index do |_, i|
  arr.each_with_index do |_, j|
    puts i, j
  end
end
