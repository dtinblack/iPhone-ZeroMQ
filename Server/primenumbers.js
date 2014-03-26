var zeromq = require('zmq');

var socket = zeromq.socket('pub');

var primes = new Array();

primes[0] = 1;
primes[1] = 2;

var prime  = 1;
var number = 3;
var found  = 0;

function mod(n, m) {
 return n % m;
}

socket.bind('tcp://127.0.0.1:2001', function(error) {
            
            if (error) {
            console.log(error);
            }
            
            console.log("Listening on port 2001");
            
            
            // Prime Number calculations
            
            while ( prime < 200000 ) {
            
            for ( var i = 1; i <= prime; i++ ) {
            
            var value = number / primes[ i ];
            var intvalue = Math.floor(value);
            
            if ( value ==  intvalue ) { found = 1;} // not a prime
            
            }
            
            if ( found == 0 ) {
            
            prime++;
            
            primes[prime] = number;
            
            } else {
            
            found = 0;
            }
            
            if( mod( number, 1000 ) == 0 ) { // publish every 1000'th prime
            
            console.log('sending prime: ' + primes[prime]);

            socket.send('PRIME' + '   ' + primes[prime]);
            
 
            }
            
            number++;
            }
            
  });




    

