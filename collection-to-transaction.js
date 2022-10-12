var fs = require('fs');
const transaction = require('./output/Bundle-example-cpBundle.json');
// console.log(transaction.resourceType);
transaction.type = "transaction"
// console.log(transaction.type);
// console.log(transaction.entry);
// console.log(transaction.entry[0]);
// console.log(transaction.entry[0].resource.id);
// transaction.entry[0].request = { method: 'POST', url: transaction.entry[0].resource.resourceType };
// console.log(transaction.entry[0].request);
// console.log(transaction.entry[0].request.method);
// transaction.entry.forEach(addRequest) 

// function addRequest() {

// }
for (let e of transaction.entry) {
	e.request = { method: 'POST', url: e.resource.resourceType };
}
// console.log(transaction);
fs.writeFile('./output/Bundle-example-cpBundle-transaction.json', JSON.stringify(transaction), function(err) {
  if(err) console.log(err)
})
