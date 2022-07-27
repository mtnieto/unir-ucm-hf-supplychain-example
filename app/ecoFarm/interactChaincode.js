const { Gateway, Wallets } = require('fabric-network');
const fs = require('fs');
const path = require('path');

const ccpPath = path.resolve(__dirname, 'connection.json');
const ccpJSON = fs.readFileSync(ccpPath, 'utf8');
const ccp = JSON.parse(ccpJSON);
let network, gateway; 

async function connectNetwork(){
    const walletPath = '/tmp/hfnode/wallet/ecoFarm';
    const wallet = await Wallets.newFileSystemWallet(walletPath);
   gateway = new Gateway();
    await wallet.get("adminCA");
    await gateway.connect(ccp, {
        wallet: wallet,
        identity: "adminCA",
        discovery: {
            enabled: false,
            asLocalhost: true,
        }
    });
    network = await gateway.getNetwork('channel1');
}

async function disconnectNetwork(){
    await gateway.disconnect();
}


async function registerProductFromFarm(id, location, details){
    try{
        const contract = network.getContract('supplychain')
        console.log('Register product from farm')
        await contract.submitTransaction('registerProductFromFarm', id, location, details)
    } catch(err){
        console.log(err);
    }
}

async function updateTransportProduct(id, location, details){
    try {
        console.log("This should not work")
        const contract = network.getContract('supplychain')
        await contract.submitTransaction('updateTransportProduct', id, location, details)
    } catch (err) {
        console.log('If this msg is printed, the transaction not worked as expected')
       // console.log(err);
    }
}

async function getAllHistoryProduct(id){
    try {
        const contract = network.getContract('supplychain')
        const result = await contract.evaluateTransaction('getAllHistoryProduct', id)
        console.log('All the transactions: ' + result.toString())
    } catch (err) {
       console.log(err);
    }
}




async function main() {
    try {
    console.log("Connecting network");
    await connectNetwork();
    console.log('Submit transactions')
    await registerProductFromFarm('Product1', "Madrid", "Producto y sus detalles")
    await updateTransportProduct('Product1', "Ciudad Real", "Producto y sus detalles")
    await getAllHistoryProduct('Product1')
    
    await disconnectNetwork() 





    } catch (err) {

        console.error(`Failed to submit transaction: ${err}`);
        process.exit(1);
    }
}
main();