ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
CORE_PEER_LOCALMSPID="ecoMarketMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoMarket.example.com/peers/peer0.ecoMarket.example.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoMarket.example.com/users/Admin@ecoMarket.example.com/msp
CORE_PEER_ADDRESS=peer0.ecoMarket.example.com:9051
CHANNEL_NAME=channel1
CORE_PEER_TLS_ENABLED=true


peer channel join -b $CHANNEL_NAME.block  >&log.txt
cat log.txt

