#import randomArray
import randomArray

array = randomArray.randomArray()

unsortedIndex = len(array) - 1
while unsortedIndex >= 0:
    i = unsortedIndex + 1
    if i < len(array):
        while i < len(array) and array[unsortedIndex] > array[i]:
            i += 1
        value = array[unsortedIndex]
        i -= 1
        print(f"{array[unsortedIndex]},{array[i]}")
        for j in range(unsortedIndex, i):
            array[j], array[j+1] = array[j+1], array[j]
    unsortedIndex -= 1
    print(array)
print(array)
