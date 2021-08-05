#!/bin/bash

echo "Start project initialization"

# User inputs
read -p "Project name: " name;

read -p "Project location: " path;

# shellcheck disable=SC2164
cd "$path"

mkdir "$name"

cd "$name"

# Create package.json file for project
cat > package.json << EOF
{
  "name": "$name",
  "version": "0.0.1",
  "main": "src/index.ts",
  "author": "Taylor Gagne",
  "license": "MIT",
  "scripts": {
    "postinstall": "typesync || :",
    "dev": "nodemon server.ts",
    "start": "ts-node-dev src/index.ts",
    "test": "jest",
    "test:watch": "jest --watch"
  },
  "devDependencies": {
    "@types/express": "^4.17.11",
    "@types/jest": "^26.0.22",
    "@types/morgan": "^1.9.2",
    "@types/node": "^14.14.33",
    "@types/nodemon": "^1.19.0",
    "jest": "^26.6.3",
    "nodemon": "^2.0.7",
    "ts-jest": "^26.5.5",
    "ts-node": "^9.1.1",
    "ts-node-dev": "^1.1.6",
    "typescript": "^4.2.3",
    "typesync": "^0.8.0"
  },
  "dependencies": {
    "body-parser": "^1.19.0",
    "dotenv": "^8.2.0",
    "express": "^4.17.1",
    "morgan": "^1.10.0",
    "neogma": "^1.8.1"
  }
}
EOF

cat > .env << EOF
PORT=4000
NEO_URl=bolt://localhost:7687
NEO_USER=neo4j
NEO_PASS=password
EOF

echo "Installing npm dependencies"

yarn install

mkdir "src"

touch "src/index.ts"










