function biggest(array) {
  if(array.length == 0) return null
  return array.reduce((acc, current) => (current > acc ? current : acc), array[0])
}

console.log(biggest([2, 5, 3, 1]))
