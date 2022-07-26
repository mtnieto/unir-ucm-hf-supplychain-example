ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
CORE_PEER_LOCALMSPID="ecoFarmMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoFarm.example.com/peers/peer0.ecoFarm.example.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoFarm.example.com/users/Admin@ecoFarm.example.com/msp
CORE_PEER_ADDRESS=peer0.ecoFarm.example.com:7051
CHANNEL_NAME=channel1
CORE_PEER_TLS_ENABLED=true

export CC_PACKAGE_ID="cc:d1c4fb58cfbba0947fe1ed16877fd94f96c10e9b107cfbaacf1e4f3a19d42e1b"

peer chaincode query -o orderer0.example.com:7050  --tls true --cafile $ORDERER_CA -C $CHANNEL_NAME -n fabcar --peerAddresses $CORE_PEER_ADDRESS --tlsRootCertFiles $CORE_PEER_TLS_ROOTCERT_FILE  -c '{"Args":["queryCar","CAR1"]}'  >&log.txt 
cat log.txt