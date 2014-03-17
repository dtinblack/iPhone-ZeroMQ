var zmq = require('zmq')
, sock = zmq.socket('rep');

sock.bindSync('tcp://127.0.0.1:3000');

console.log('Prime Number server bound to port 3000');

sock.on('message', function(msg){
        console.log('Server recieved: %s', msg.toString());
        sock.send("Hello from the Prime Number server");
        
        if( msg == "close") {
           console.log('Recieved message from app to close');
           sock.close();
        
        }
        
 });



    

