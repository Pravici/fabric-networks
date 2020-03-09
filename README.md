# fabric-networks


## Start the Network 
```bash
./start.sh
```

## Instantiate the Chaincode 
```bash
./instantiate.sh
```

## View CouchDB
Open <http://localhost:5984/_utils/#/_all_dbs> to view the database.

## Invoke Chaincode or Contract
```bash
# ./invoke.sh "<method>" '<json>'
./invoke.sh "echo" '{ "message": "hello world!" }'
```
