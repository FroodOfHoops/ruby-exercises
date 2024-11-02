# takes into account that biggest numbers get sorted to the end
# so we need to compare fewer bubbles each time

def bubble_sort(array)
  array1 = []
  sorted = []
  while array1 != array
    array1 = array - []
    (array.length-1).times do |x|
      if array[x] > array[x+1]
        tempval = array[x+1]
        array[x+1] = array[x]
        array[x] = tempval
      end
    end
    sorted.unshift(array.pop)
    array1.pop
  end
  sorted = array + sorted
  puts sorted.join(", ")
end

bubble_sort([4, 1, 63, -5, 29, 0, 17, 6, 22])
