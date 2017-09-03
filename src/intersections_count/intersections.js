(function sortedInversions() {
  const arr1 = [1, 2, 3, 4, 5]
  const arr2 = [2, 4, 6, 7, 9]

  // expected out = [2, 4]

  function intersections(arr1, arr2) {
    let result = []
    let i = 0
    let j = 0
    while(i < arr1.length && j < arr2.length) {
      if(arr1[i] > arr2[j]) {
        j++
      } else if (arr1[i] < arr2[j]) {
        i++
      } else {
        result.push(arr1[i])
        i++
        j++
      }
    }
    return result
  }

  console.log(intersections(arr1, arr2))
})()
