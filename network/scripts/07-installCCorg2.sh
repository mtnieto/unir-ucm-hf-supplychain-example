export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export CORE_PEER_LOCALMSPID="logisticTransMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/logisticTrans.example.com/peers/peer0.logisticTrans.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/logisticTrans.example.com/users/Admin@logisticTrans.example.com/msp
export CORE_PEER_ADDRESS=peer0.logisticTrans.example.com:8051
export CHANNEL_NAME=channel1
export CORE_PEER_TLS_ENABLED=true

peer lifecycle chaincode install chaincode.tar.gz >&log.txt
cat log.txt
