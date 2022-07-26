ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
CORE_PEER_LOCALMSPID="logisticTransMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/logisticTrans.example.com/peers/peer0.logisticTrans.example.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/logisticTrans.example.com/users/Admin@logisticTrans.example.com/msp
CORE_PEER_ADDRESS=peer0.logisticTrans.example.com:8051
CHANNEL_NAME=channel1
CORE_PEER_TLS_ENABLED=true
peer channel update -o orderer0.example.com:7050 -c $CHANNEL_NAME --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA  -f ./channel-artifacts/logisticTransMSPanchors.tx >&log.txt 
cat log.txt
sleep 10
ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
CORE_PEER_LOCALMSPID="ecoFarmMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoFarm.example.com/peers/peer0.ecoFarm.example.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoFarm.example.com/users/Admin@ecoFarm.example.com/msp
CORE_PEER_ADDRESS=peer0.ecoFarm.example.com:7051
CHANNEL_NAME=channel1
CORE_PEER_TLS_ENABLED=true

peer channel update -o orderer0.example.com:7050 -c $CHANNEL_NAME --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA  -f ./channel-artifacts/ecoFarmMSPanchors.tx >&log.txt 
cat log.txt


ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
CORE_PEER_LOCALMSPID="ecoMarketMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoMarket.example.com/peers/peer0.ecoMarket.example.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoMarket.example.com/users/Admin@ecoMarket.example.com/msp
CORE_PEER_ADDRESS=peer0.ecoMarket.example.com:9051
CHANNEL_NAME=channel1
CORE_PEER_TLS_ENABLED=true

peer channel update -o orderer0.example.com:7050 -c $CHANNEL_NAME --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA  -f ./channel-artifacts/ecoMarketMSPanchors.tx >&log.txt 
cat log.txt