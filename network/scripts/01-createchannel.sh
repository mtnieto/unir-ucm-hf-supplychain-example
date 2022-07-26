ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
CORE_PEER_LOCALMSPID="logisticTransMSP"
CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/logisticTrans.example.com/peers/peer0.logisticTrans.example.com/tls/ca.crt
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/logisticTrans.example.com/users/Admin@logisticTrans.example.com/msp
CORE_PEER_ADDRESS=peer0.logisticTrans.example.com:7051
CHANNEL_NAME=channel1
CORE_PEER_TLS_ENABLED=true
ORDERER_SYSCHAN_ID=syschain
CORE_PEER_TLS_CLIENTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/users/Admin@example.com/tls/client.crt
CORE_PEER_TLS_CLIENTKEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/users/Admin@example.com/tls/client.key
#  --clientauth \
#   --certfile "$CORE_PEER_TLS_CLIENTCERT_FILE" \
#   --keyfile "$CORE_PEER_TLS_CLIENTKEY_FILE" \
#   --tls
peer channel create -o orderer0.example.com:7050 -c $CHANNEL_NAME -f ./channel-artifacts/channel1.tx --tls $CORE_PEER_TLS_ENABLED --cafile $ORDERER_CA >&log.txt 
cat log.txt

