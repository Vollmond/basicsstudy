function isPalindrome(str) {
  for(let i = 0; i < str.length; i++) {
    if(str[i] !== str[str.length - (i + 1)]) return false
  }
  return true
}

let palinStr = 'мечем'
let notPalinStr = 'мебим'

console.log(isPalindrome(palinStr))
console.log(isPalindrome(notPalinStr))
