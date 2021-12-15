require('dotenv').config()

const contract = (name, nameOnChain) => {
  return {
    name,
    nameOnChain,
    type: 'contract',
    stakes: {
      cpu: '40.0000 TLOS',
      net: '40.0000 TLOS',
      ram: 1000000
    }
  }
}

const devKey = 'EOS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV'
const devTelosKey = 'EOS8CiMM6Lqsahghzy7LSqxcRc67PG8n2gnjaTQ1ePG5nWwnqYWEm'


const supportedChains = {
  local: 'local',
  telosTestnet: 'telosTestnet',
  telosMainnet: 'telosMainnet'
}

const ownerByChain = {
  [supportedChains.local]: 'eosio',
  [supportedChains.telosTestnet]: 'llcdaomowner',
  [supportedChains.telosMainnet]: ''
}

const ownerPublicKeysByChain = {
  [supportedChains.local]: {
    owner: devKey,
    active: devKey
  },
  [supportedChains.telosTestnet]: {
    owner: devTelosKey,
    active: devTelosKey
  },
  [supportedChains.telosMainnet]: {

  }
}

const publicKeysByChain = {
  [supportedChains.local]: {
    owner: devKey,
    active: devKey
  },
  [supportedChains.telosTestnet]: {
    owner: devTelosKey,
    active: devTelosKey
  },
  [supportedChains.telosMainnet]: {

  }
}

const contractsConfig = {
  [supportedChains.local]: [
    contract('document_editor', 'hashdgeowner'),
  ],
  [supportedChains.telosTestnet]: [
    contract('document_editor', 'hashdgeowner')
  ],
  [supportedChains.telosMainnet]: [

  ]
}

const chain = process.env.CHAIN_NAME

const owner = ownerByChain[chain]
const ownerPublicKeys = ownerPublicKeysByChain[chain]
const publicKeys = publicKeysByChain[chain]

const contracts = contractsConfig[chain]
const contractNames = {}
const nameOnChainToName = {}

for (const c of contracts) {
  contractNames[c.name] = c.nameOnChain
  nameOnChainToName[c.nameOnChain] = c.name
}

const permissionsConfig = [
  {
    target: `${contractNames.genericdoc}@active`,
    actor: `${contractNames.genericdoc}@eosio.code`
  }
]

function isLocalNode () {
  return chain == supportedChains.local
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

module.exports = {
  contracts, contractNames, nameOnChainToName, owner, ownerPublicKeys, publicKeys, devKey, isLocalNode, sleep, chain, permissionsConfig
}
