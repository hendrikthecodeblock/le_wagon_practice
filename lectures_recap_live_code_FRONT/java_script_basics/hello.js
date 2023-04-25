// console.log('Hello World');
// console.log(typeof('hello world'));
// console.log(typeof(42));

// console.log(typeof((42, 10).toString()));
// console.log(Number.parseInt(42));

// let counter = 1;
// console.log(counter);

// counter = counter + 1;
// console.log(counter);

// const firstName = 'Paul'
// console.log(firstName);

// firstName = 'John'; TypeError: Assignment to constant variable.
// console.log(firstName.substring(1));

// console.log(firstName.toUpperCase());
// console.log(firstName.toLowerCase());

// const monthString = 'Jan,Feb,Mar,Apr';
// const months = monthString.split(',');
// console.log(months);

// const firstName = 'Ringo';
// const lastName = 'Starr';

// message = `${firstName} ${lastName} is a drummer.`
// console.log(message);

// const fruits = [];
// fruits.push('Apple');
// console.log(fruits[0]);
// fruits[0] = 'Banana';
// fruits.splice(0,1);

// const beatles = ["paul", "john", "ringo", "george"];

// beatles.forEach((beatle) => {
//   console.log(beatle.toUpperCase());
// });

// const age = 21;

// if (age >= 18) {
//   console.log("You can vote");
// } else {
//   console.log('You can\'t vote');
// };

// const digit = 0;

// if (digit === 0) {
//   console.log('Zero');
// } else if (digit === 1) {
//   console.log('One');
// } else {
//   console.log('I don\'t know this number');
// }

// const student = {
//   firstName: 'Boris',
//   lastName: 'Pilliard'
// };

// console.log(typeof(student));

// console.log(student);

// console.log(student.firstName);
// console.log(student['firstName']);

// const capitalizedWord = word => {
//   console.log(word);
//   const firstLetter = word[0].toUpperCase();
//   console.log(firstLetter);
//   const restOfWord = word.substring(1).toLowerCase()
//   return `${firstLetter}${restOfWord}`;
// }

// console.log(capitalizedWord('hello'));

const instruments = {
  'john': 'guitar',
  'paul': 'bass',
  'ringo': 'drums'
}

Object.keys(instruments).forEach(beatle => {
  console.log(`${beatle} played the ${instruments[beatle]}`)
});

for (const [key, value] of Object.entries(instruments)) {
  console.log(`${key} plays the ${value}`);
};
