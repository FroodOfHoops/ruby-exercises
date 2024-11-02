def bubble_sort(array)
  array1 = []
  while array1 != array
    array1 = array - []
    (array.length-1).times do |x|
      if array[x] > array[x+1]
        tempval = array[x+1]
        array[x+1] = array[x]
        array[x] = tempval
      end
    end
  end
  puts array.join(", ")
end

bubble_sort([4, 1, 63, -5, 29, 0, 17, 6, 22])

# in version 2, shift array after each loop and build final array
# fewer iterations needed each time
