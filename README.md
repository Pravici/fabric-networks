# fabric-networks

## Generate the config
cryptogen generate
configtxgen -channelID system-channel -profile OneOrgOrdererGenesis -outputBlock ./config/genesis.block
configtxgen -channelID mychannel -outputCreateChannelTx ./config/mychannel.tx -profile OneOrgChannel
configtxgen -channelID demo1 -outputCreateChannelTx ./config/demo1.tx -profile OneOrgChannel
configtxgen -channelID demo2 -outputCreateChannelTx ./config/demo2.tx -profile OneOrgChannel
configtxgen -channelID demo3 -outputCreateChannelTx ./config/demo3.tx -profile OneOrgChannel
configtxgen -channelID demo4 -outputCreateChannelTx ./config/demo4.tx -profile OneOrgChannel
configtxgen -channelID demo5 -outputCreateChannelTx ./config/demo5.tx -profile OneOrgChannel
configtxgen -channelID demo6 -outputCreateChannelTx ./config/demo6.tx -profile OneOrgChannel
configtxgen -channelID demo7 -outputCreateChannelTx ./config/demo7.tx -profile OneOrgChannel
configtxgen -channelID demo8 -outputCreateChannelTx ./config/demo8.tx -profile OneOrgChannel
configtxgen -channelID demo9 -outputCreateChannelTx ./config/demo9.tx -profile OneOrgChannel

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
