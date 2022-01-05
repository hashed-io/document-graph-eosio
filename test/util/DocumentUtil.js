const { createRandomAccount, randomAccountName } = require('../../scripts/eosio-util')

const LoremIpsum = require("lorem-ipsum").LoremIpsum;

const lorem = new LoremIpsum({
  sentencesPerParagraph: {
    max: 8,
    min: 4
  },
  wordsPerSentence: {
    max: 22,
    min: 4
  }
});

/*
console.log("generate words 1")
console.log(lorem.generateWords(1))

console.log("generate sentenses")
console.log(lorem.generateSentences(5))

console.log("generate parag")
console.log(lorem.generateParagraphs(7))

*/


class Document {

  constructor (
    creator,
    content_groups
    
  ) {
    this.params = {
      creator,
      content_groups
    }
  }

  getActionParams () {

    return [
      this.params.creator,
      this.params.content_groups
    ]
  }

  getActionCreateParams () {

    return [
      this.params.creator,
      this.params.content_groups
    ]
  }

}

class DocumentFactory {
  
  static createEntry ({
    creator,
    content_groups
  }) {

    return new Document (
      creator,
      content_groups
    )
  }

  static async createWithDefaults ({
    creator,
    content_groups

  }) {
    
    if (!creator) {
      creator = await createRandomAccount() 
    }

    if (!content_groups) {
      content_groups = [

              [ 
                  { "label": "content_group_label", "value": [ "string", "system" ] }, 
                  { "label": "type", "value": [ "name", "document" ] }, 
                  { "label": "node_label", "value": [ "string", lorem.generateWords(1) ] } 
              ],
              [ 
                  { "label": "content_group_label", "value": [ "string", "fixed_details" ] }, 
                  { "label": "type", "value": [ "name", "document" ] }, 
                  { "label": "owner", "value": [ "name", creator ] } 
              ], 
              [
                  { "label": "content_group_label", "value": [ "string", "details" ] },
                  { "label": randomAccountName(), "value": [ "string", lorem.generateSentences(5) ] }, 
                  { "label": randomAccountName(), "value": [ "string", lorem.generateSentences(5) ] },
                  { "label": randomAccountName(), "value": [ "string", lorem.generateParagraphs(10) ] },
              ]
          ]
    }

    return DocumentFactory.createEntry({
      creator,
      content_groups
    })
  }

}

module.exports = { Document, DocumentFactory }