export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export CORE_PEER_LOCALMSPID="ecoFarmMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoFarm.example.com/peers/peer0.ecoFarm.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoFarm.example.com/users/Admin@ecoFarm.example.com/msp
export CORE_PEER_ADDRESS=peer0.ecoFarm.example.com:7051
export CHANNEL_NAME=channel1
export CORE_PEER_TLS_ENABLED=true

export CORE_PEER_TLS_CLIENTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoFarm.example.com/users/Admin@ecoFarm.example.com/tls/client.crt
export CORE_PEER_TLS_CLIENTKEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoFarm.example.com/users/Admin@ecoFarm.example.com/tls/client.key
export PATHCC=/opt/gopath/src/github.com/hyperledger/fabric/examples/chaincode/go/marbles02/javascript


# cd $PATH
# GO111MODULE=on go mod vendor
# cd -

peer lifecycle chaincode package chaincode.tar.gz --path $PATHCC --lang node --label marbles02 

peer lifecycle chaincode install chaincode.tar.gz 



