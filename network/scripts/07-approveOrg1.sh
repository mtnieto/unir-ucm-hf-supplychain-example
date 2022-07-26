export ORDERER_CA=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export CORE_PEER_LOCALMSPID="ecoFarmMSP"
export CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoFarm.example.com/peers/peer0.ecoFarm.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/ecoFarm.example.com/users/Admin@ecoFarm.example.com/msp
export CORE_PEER_ADDRESS=peer0.ecoFarm.example.com:7051
export CHANNEL_NAME=channel1
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_TLS_CLIENTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/tls/server.crt
export CORE_PEER_TLS_CLIENTKEY_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/tls/server.key
export CC_PACKAGE_ID="marbles02:b8aa5ac0eadc7218f95f1f544c6839fcef8504f79fad5c4b10e990c9dd68ddf9"
export ORDERER_URL=orderer0.example.com:7050

peer lifecycle chaincode approveformyorg -o $ORDERER_URL --init-required --ordererTLSHostnameOverride orderer0.example.com  --channelID $CHANNEL_NAME --name marbles02 --version 1.0  --package-id $CC_PACKAGE_ID --sequence 1 --tls true --cafile $ORDERER_CA 


peer lifecycle chaincode checkcommitreadiness --channelID   $CHANNEL_NAME --init-required --name marbles02 --version 1.0  --sequence 1 --tls true --cafile $ORDERER_CA --output json

