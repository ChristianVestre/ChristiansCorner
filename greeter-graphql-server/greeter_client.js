//grpc_tools_node_protoc --js_out=import_style=commonjs,binary:../ --grpc_out=../ --plugin=protoc-gen-grpc=`which grpc_tools_node_protoc_plugin` helloworld.proto

const messages = require('./helloworld_pb');
const services = require('./helloworld_grpc_pb');

const grpc = require('grpc')

function main(){
    const greeterClient = new services.GreeterClient('localhost:50051',grpc.credentials.createInsecure());
    const greeterRequest  = new messages.HelloRequest();
    const firstNameRequest = new messages.FirstNameRequest();
    const lastNameRequest = new messages.LastNameRequest();

    var user;
    let firstName;
    let lastName;
    if (process.argv.length >= 3) {
      user = process.argv[2] + ' ' + process.argv[3];
      firstName = process.argv[2]
      lastName = 'Herr' + ' ' + process.argv[3]
    } else {
      user = 'world';
      firstName = 'Big W'
      lastName = 'Mister World'
    }
    
    greeterRequest.setName(user);
    firstNameRequest.setFirstname(firstName)
    lastNameRequest.setLastname(lastName)

    greeterClient.sayHello(greeterRequest, function(err, response) {
      console.log('Greeting:', response.getMessage());
    });
    greeterClient.giveFirstName(firstNameRequest, function(err, response) {
      console.log('Greeting:', response.getFirstnamereply());
    });
    greeterClient.giveLastName(lastNameRequest, function(err, response) {
      console.log('Greeting:', response.getLastnamereply());
    });

  }
  
  main();