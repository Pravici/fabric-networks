# fabric-networks

## Generate the config
cryptogen generate
configtxgen -channelID system-channel -profile OneOrgOrdererGenesis -outputBlock ./config/genesis.block
configtxgen -channelID mychannel -outputCreateChannelTx ./config/mychannel.tx -profile OneOrgChannel

configtxgen -channelID demo0general -outputCreateChannelTx ./config/demo0general.tx -profile OneOrgChannel
configtxgen -channelID demo0issuer -outputCreateChannelTx ./config/demo0issuer.tx -profile OneOrgChannel

configtxgen -channelID demo1general -outputCreateChannelTx ./config/demo1general.tx -profile OneOrgChannel
configtxgen -channelID demo1issuer -outputCreateChannelTx ./config/demo1issuer.tx -profile OneOrgChannel

configtxgen -channelID demo2general -outputCreateChannelTx ./config/demo2general.tx -profile OneOrgChannel
configtxgen -channelID demo2issuer -outputCreateChannelTx ./config/demo2issuer.tx -profile OneOrgChannel

configtxgen -channelID demo3general -outputCreateChannelTx ./config/demo3general.tx -profile OneOrgChannel
configtxgen -channelID demo3issuer -outputCreateChannelTx ./config/demo3issuer.tx -profile OneOrgChannel

configtxgen -channelID demo4general -outputCreateChannelTx ./config/demo4general.tx -profile OneOrgChannel
configtxgen -channelID demo4issuer -outputCreateChannelTx ./config/demo4issuer.tx -profile OneOrgChannel

configtxgen -channelID demo5general -outputCreateChannelTx ./config/demo5general.tx -profile OneOrgChannel
configtxgen -channelID demo5issuer -outputCreateChannelTx ./config/demo5issuer.tx -profile OneOrgChannel

configtxgen -channelID demo6general -outputCreateChannelTx ./config/demo6general.tx -profile OneOrgChannel
configtxgen -channelID demo6issuer -outputCreateChannelTx ./config/demo6issuer.tx -profile OneOrgChannel

configtxgen -channelID demo7general -outputCreateChannelTx ./config/demo7general.tx -profile OneOrgChannel
configtxgen -channelID demo7issuer -outputCreateChannelTx ./config/demo7issuer.tx -profile OneOrgChannel

configtxgen -channelID demo8general -outputCreateChannelTx ./config/demo8general.tx -profile OneOrgChannel
configtxgen -channelID demo8issuer -outputCreateChannelTx ./config/demo8issuer.tx -profile OneOrgChannel

configtxgen -channelID demo9general -outputCreateChannelTx ./config/demo9general.tx -profile OneOrgChannel
configtxgen -channelID demo9issuer -outputCreateChannelTx ./config/demo9issuer.tx -profile OneOrgChannel

## Start the Network 
```bash
./start.sh
```

## Instantiate the Chaincode 
```bash
./instantiate.sh
```

## View CouchDB
Open <http://localhost:5050/_utils/#/_all_dbs> to view the database.

## Invoke Chaincode or Contract
```bash
# ./invoke.sh "<method>" '<json>'
./invoke.sh "echo" '{ "message": "hello world!" }'
```
