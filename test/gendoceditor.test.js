const assert = require('assert')
const { rpc } = require('../scripts/eos')
const { getContracts, createRandomAccount, initContract, Asset, getAccountBalance } = require('../scripts/eosio-util')
const { assertError } = require('../scripts/eosio-errors')

const { contractNames, contracts: configContracts, isLocalNode, sleep } = require('../scripts/config')

const { getParams, setParamsValue } = require('../scripts/contract-settings')

const { AssertionError } = require('assert')
const { updatePermissions } = require('../scripts/permissions')

const { EnvironmentUtil } = require('./util/EnvironmentUtil')
const { DocumentFactory } = require('./util/DocumentUtil')
const { ConcurrentTaskQueue } = require('./util/BatchGenerator')

const expect = require('chai').expect

const { document_editor } = contractNames

describe('Tests for generic document editor', async function () {

  let contracts

  before(async function () {
    if (!isLocalNode()) {
      console.log('These tests should only be run on a local node')
      process.exit(1)
    }

  })

  beforeEach(async function () {
    await EnvironmentUtil.initNode()
    await sleep(5000)
    await EnvironmentUtil.deployContracts(configContracts)

    contracts = await getContracts([document_editor])

    // await updatePermissions()

    // await setParamsValue()

  })

  
  afterEach(async function () {
    await EnvironmentUtil.killNode()

    // reset contract

  })
  

  it('Reset contract', async function() {

    // Act

    console.log(contracts.document_editor)

    await contracts.document_editor.reset( { authorization: `${document_editor}@active` } )

  })

  it('Create a document', async function () {
    
    // Arrange
    const alice = await createRandomAccount()

    const doc = await DocumentFactory.createWithDefaults({creator: alice})
    const actionParams = doc.getActionParams()

    console.log(...actionParams)

    // Act
    await contracts.document_editor.createdoc( ...actionParams, { authorization: `${alice}@active` } )

    console.log(configContracts)


    // Assert


  })

  it('Create multiple documents at the same time', async function () {

    const docGen = async () => {

      let created

      try {

        const doc =  await DocumentFactory.createWithDefaults({})
        const actionParams = doc.getActionParams()

        await contracts.document_editor.createdoc( ...actionParams, { authorization: `${doc.params.creator}@active` } )

        created = true
      } catch (err) {

        created = false

      }

      if ( created ) {
        return( 1 )

      } else {
        return ( 0 )

      }

    }

    const promiseGen = async (args) => {

      let promises = []

      for (var i = 0; i < args; i++) {
        promises.push(new costlyFunction() )
      }

      return await Promise.all(promises).then((res) => {
        return res
      })
    }

    await Promise.all(promiseGen(100))

    function costlyFunction () {
      return new Promise((resolve, reject) => {
        let sum = 0
        sum = docGen()
        console.log( sum )
        resolve(sum);

      })
    }
    /*
    const batchSize = 4;
    const taskQueue = new ConcurrentTaskQueue(promiseGen(100), batchSize);
    taskQueue.runTasks()
      .then((res) => {
        console.log(res)

      }).catch((err) => {
        console.log(err)
      });

      */

  })


})