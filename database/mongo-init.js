db = db.getSiblingDB(process.env.MONGO_DATABASE);

// https://www.mongodb.com/docs/manual/reference/built-in-roles/#std-label-built-in-roles
db.createUser(
  {
    user: process.env.MONGO_INITDB_ROOT_USERNAME,
    pwd: process.env.MONGO_INITDB_ROOT_PASSWORD,
    roles: [
      { role: "dbOwner", db: process.env.MONGO_DATABASE },
    ],
  },
);

// Create default collections
db.createCollection('auth');
db.createCollection('applications');
db.createCollection('contacts');
db.createCollection('transactions');
db.createCollection('logs');
