var zmq = require('zmq')
  , sock = zmq.socket('rep');

sock.bindSync('tcp://127.0.0.1:3000');

console.log('Hello World bound to port 3000');

sock.on('message', function(msg){
  console.log('Server recieved: %s', msg.toString());
  sock.send("Hello from the server");
});

