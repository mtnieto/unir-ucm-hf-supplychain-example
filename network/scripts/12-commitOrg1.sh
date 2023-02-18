export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export CORE_PEER_LOCALMSPID="ecoFarmMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoFarm.example.com/peers/peer0.ecoFarm.example.com/tls/ca.crt
export CORE_PEER_TLS_ROOTCERT_FILE2=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/logisticTrans.example.com/peers/peer0.logisticTrans.example.com/tls/ca.crt
export CORE_PEER_TLS_ROOTCERT_FILE3=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoMarket.example.com/peers/peer0.ecoMarket.example.com/tls/ca.crt

export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoFarm.example.com/users/Admin@ecoFarm.example.com/msp
export CORE_PEER_ADDRESS=peer0.ecoFarm.example.com:7051
export CHANNEL_NAME=channel1
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_CLIENTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/tls/server.crt
export CORE_PEER_TLS_CLIENTKEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/tls/server.key
export ORDERER_URL=orderer0.example.com:7050
export CC_PACKAGE_ID=supplychain:ba6386878158819c52529858825f87a5a3b2d812d0e60473dc01160df4b3bdaa


peer lifecycle chaincode commit -o orderer0.example.com:7050  --channelID $CHANNEL_NAME --name supplychain --version 1.0 --sequence 1  --tls true --cafile $ORDERER_CA --peerAddresses peer0.ecoFarm.example.com:7051 --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE  --peerAddresses peer0.logisticTrans.example.com:8051 --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE2 --peerAddresses peer0.ecoMarket.example.com:9051 --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE3 

cat log.txt
