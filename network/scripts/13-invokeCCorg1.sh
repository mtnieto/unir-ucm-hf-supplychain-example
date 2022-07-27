ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
CORE_PEER_LOCALMSPID="ecoFarmMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoFarm.example.com/peers/peer0.ecoFarm.example.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoFarm.example.com/users/Admin@ecoFarm.example.com/msp
CORE_PEER_ADDRESS=peer0.ecoFarm.example.com:7051
CORE_PEER_ADDRESS2=peer0.logisticTrans.example.com:8051
CORE_PEER_TLS_ROOTCERT_FILE2=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/logisticTrans.example.com/peers/peer0.logisticTrans.example.com/tls/ca.crt

CHANNEL_NAME=channel1
CORE_PEER_TLS_ENABLED=true
CORE_PEER_TLS_CLIENTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/tls/server.crt
CORE_PEER_TLS_CLIENTKEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/tls/server.key
export CC_PACKAGE_ID="supplychain:560d95c8ee87e4c6a50b75437103ed066496caf5c9491086f4e3cea85a11d6ed"



peer chaincode invoke -o orderer0.example.com:7050  --tls true --cafile $ORDERER_CA -C $CHANNEL_NAME -n supplychain --peerAddresses $CORE_PEER_ADDRESS --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE -c '{"Args":["registerProductFromFarm","idProducto-1","madrid","this is the detail"]}' --waitForEvent  >&log.txt 
cat log.txt