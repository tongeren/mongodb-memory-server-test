const mongoose = require('mongoose');
const { MongoMemoryServer } = require('mongodb-memory-server');

let mongoServer;

exports.dbConnect = async () => {
  jest.setTimeout(60000);
  mongoServer = await MongoMemoryServer.create({
    binary: { version: 'latest' }
  });
  const uri = mongoServer.getUri();

  const mongooseOpts = {
    useNewUrlParser: true,
    dbName: "verify",
    useUnifiedTopology: true
  };

  await mongoose.connect(uri, mongooseOpts);
};

exports.dbDisconnect = async () => {
  await mongoose.connection.dropDatabase();
  await mongoose.connection.close();
  await mongoServer.stop();
};