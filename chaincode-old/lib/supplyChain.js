
'use strict';

const { Contract } = require('fabric-contract-api');

class SupplyChain extends Contract {



    async registerProductFromFarm(ctx, idProduct, location, details) {
        console.info('============= START : Registering product ===========');
        const mspID = ctx.stub.getMspID();
        if (mspID != 'ecoFarmMSP') {
            throw new Error(`The organization with id: ${mspID} has not permission to change the data`);
        }
        const product = {
            location,
            details
        };

        await ctx.stub.putState(idProduct, Buffer.from(JSON.stringify(product)));
        console.info('============= END : Registered Product Car ===========');
    }

   

    async updateTransportProduct(ctx, idProduct, location, details) {
        console.info('============= START : updateTransportProduct ===========');
        const mspID = ctx.stub.getMspID();
        if (mspID != 'logisticTransMSP') {
            throw new Error(`The organization with id: ${mspID} has not permission to change the data`);
        }
        const productBytes = await ctx.stub.getState(idProduct); 
        if (!productBytes || productBytes.length === 0) {
            throw new Error(`Product with id: ${idProduct} does not exist`);
        }
        const product = {
            location,
            details
        };

        await ctx.stub.putState(idProduct, Buffer.from(JSON.stringify(product)));
        console.info('============= END : updateTransportProduct ===========');
    }


    async confirmDeliveryProduct(ctx, idProduct, location, details) {
        console.info('============= START : confirmDeliveryProduct ===========');
        const mspID = ctx.stub.getMspID();
        if (mspID != 'ecoMarketMSP') {
            throw new Error(`The organization with id: ${mspID} has not permission to change the data`);
        }
        const productBytes = await ctx.stub.getState(idProduct); 
        if (!productBytes || productBytes.length === 0) {
            throw new Error(`Product with id: ${idProduct} does not exist`);
        }
        const product = {
            location,
            details
        };

        await ctx.stub.putState(idProduct, Buffer.from(JSON.stringify(product)));
        console.info('============= END : confirmDeliveryProduct ===========');
    }

    async getAllHistoryProduct(ctx, idProduct) {
        console.info('============= START : getAllHistoryProduct ===========');
        console.info('Getting history for product: ' + idProduct);
        let iterator = await ctx.stub.getHistoryForKey(idProduct);
        let result = [];
        let res = await iterator.next();
        while (!res.done) {
          if (res.value) {
            console.info(`found state update with value: ${res.value.value.toString('utf8')}`);
            const obj = JSON.parse(res.value.value.toString('utf8'));
            result.push(obj);
          }
          res = await iterator.next();
        }
        await iterator.close();
        console.info('============= END : getAllHistoryProduct ===========');
        return result;
      }
    
}

module.exports = SupplyChain;
