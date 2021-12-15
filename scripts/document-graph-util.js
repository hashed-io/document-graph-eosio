const { publicKeys, owner } = require('./config')
const { createAccount } = require('./deploy')
const { accountExists } = require('./eosio-errors')
const { updatePermissions } = require('./permissions')

const stakes = {
  cpu: '40.0000 TLOS',
  net: '40.0000 TLOS',
  ram: 1000000
}

const testAccounts = {
  firstuser: 'testuseraaa',
  seconduser: 'testuserbbb',
  thirduser: 'testuseryyy',
  fourthuser: 'testuserzzz'
}

async function createDevelopAccounts (account) {
  console.log('create develop account:', account)
  try {
    await createAccount({
      account: account,
      publicKey: publicKeys.active,
      stakes: stakes,
      creator: owner
    })
  } catch (err) {
    accountExists(err)
  }
}

async function developAccounts () {
  for (var account in testAccounts) {
    await createDevelopAccounts(testAccounts[account])
  }
}

module.exports = {
  testAccounts, developAccounts
}
