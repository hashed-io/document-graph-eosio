#include <document_editor.hpp>

#include "document_graph/content.cpp"
#include "document_graph/document.cpp"
#include "document_graph/edge.cpp"
#include "document_graph/util.cpp"
#include "document_graph/content_wrapper.cpp"
#include "document_graph/document_graph.cpp"


// document_editor::~document_editor() {}

document_editor::document_editor(name self, name code, datastream<const char *> ds) : contract(self, code, ds) {}
document_editor::~document_editor() {}

ACTION document_editor::reset () {
  require_auth(get_self()); 

  document_table d_t(_self, _self.value);
  auto ditr = d_t.begin();
  while (ditr != d_t.end()) {
    ditr = d_t.erase(ditr);
  }

  edge_table e_t(_self, get_self().value);
  auto eitr = e_t.begin();
  while (eitr != e_t.end()) {
    eitr = e_t.erase(eitr);
  }

}


/*

  Example Doc {

      "content_groups": [

              [ 
                  { "label": "content_group_label", "value": [ "string", "system" ] }, 
                  { "label": "type", "value": [ "name", "user" ] }, 
                  { "label": "node_label", "value": [ "string", "User: 4clin542u2ol" ] } 
              ],
              [ 
                  { "label": "content_group_label", "value": [ "string", "fixed_details" ] }, 
                  { "label": "type", "value": [ "name", "document" ] }, 
                  { "label": "owner", "value": [ "name", "tlaclocmant2" ] } 
              ], 
              [
                  { "label": "content_group_label", "value": [ "string", "details" ] },
                  { "label": "", "value": [ "int64", "" ] }, 
                  { "label": "", "value": [ "string", "" ] },
                  { "label": "", "value": [ "string", "" ] },
              ]
          ]
      } 

*/


ACTION document_editor::createdoc (const name &creator, hashed::ContentGroups &content_groups) {

  require_auth( has_auth(creator) ? creator : get_self() );

  bool docExists = hashed::Document::exists(get_self(), hashed::Document::hashContents(content_groups));
  check(!docExists, "document already exists");

  hashed::Document document = hashed::Document::getOrNew(get_self(), creator, content_groups);
  eosio::check(document.getCreated().sec_since_epoch() > 0, "created_date not populated when saved");

}




ACTION document_editor::editdoc (const uint64_t &documentID, hashed::ContentGroups &content_groups) {

  hashed::Document document = get_node(documentID);

  hashed::ContentWrapper document_content = document.getContentWrapper();

  name creator = document.getCreator();

  require_auth( has_auth(creator) ? creator : get_self() );

  hashed::ContentGroups & doc_cg = document.getContentGroups();

  doc_cg = content_groups;

  document.modify();

}


ACTION document_editor::extenddoc (const name &creator, const uint64_t &fromNode, const name &edgeName, hashed::ContentGroups &content_groups) { 
  
  require_auth( has_auth(creator) ? creator : get_self() );

  bool docExists = hashed::Document::exists(get_self(), hashed::Document::hashContents(content_groups));
  check(!docExists, "document already exists");

  hashed::Document document = hashed::Document::getOrNew(get_self(), creator, content_groups);
  eosio::check(document.getCreated().sec_since_epoch() > 0, "created_date not populated when saved");

  hashed::Edge::write(get_self(), creator, fromNode, document.getId(), edgeName);

}

// wip
/*
ACTION document_editor::copydoc (const name &creator, const uint64_t &fromNode) { // (creates a new document and a new edge)
  
  require_auth( has_auth(creator) ? creator : get_self() );

  hashed::Document document = get_node(fromNode);

  hashed::ContentWrapper document_content = document.getContentWrapper();

  // name owner = document_content.getOrFail(FIXED_DETAILS, OWNER) -> getAs<name>();

  hashed::ContentGroup document_node {
    hashed::ContentGroup {
      hashed::Content(hashed::CONTENT_GROUP_LABEL, FIXED_DETAILS),
      hashed::Content(TYPE, graph::DOCUMENT),
      hashed::Content(OWNER, creator)
  //    hashed::Content(EXTENDED_OF, owner),
    }
  };

  hashed::Document deltas(get_self(), creator, std::move(document_node));

  deltas = deltas.merge(deltas, document);

  deltas.modify();

  hashed::Edge::write(get_self(), creator, fromNode, deltas.getId(), graph::FORKED);


}
*/


ACTION document_editor::deletedoc (const uint64_t &documentID) {

  
  document_table d_t(_self, _self.value);
  
  auto ditr = d_t.find(documentID);
  check(ditr != d_t.end(), "Document not found");

  hashed::Document document = get_node(documentID);

  name creator = document.getCreator();

  require_auth( has_auth(creator) ? creator : get_self() );

  m_documentGraph.removeEdges(documentID);
  d_t.erase(ditr);


}

ACTION document_editor::createedge (const name &creator, const uint64_t &fromNode, const uint64_t &toNode, const name &edgeName) {
  

  document_table d_t(_self, _self.value);
  
  auto dfitr = d_t.find(fromNode);
  check(dfitr != d_t.end(), "First document not found");

  auto dtitr = d_t.find(toNode);
  check(dtitr != d_t.end(), "Second document not found");

  require_auth( creator);

  hashed::Edge::write(get_self(), creator, fromNode, toNode, edgeName);

}

// array edges

/*
  Example
  [
    { 
      fromNode: 0,
      toNode: 1,
      edgeName: edge.name
    },
    { 
      fromNode: 10,
      toNode: 11,
      edgeName: edge.name
    }
  ]
  

  or maybe using

  [
    [0, 1, edge.name],
    [10, 11, edge.name]
  ]
*/



ACTION document_editor::deleteedge (const uint64_t &fromNode, const uint64_t &toNode, const name &edgeName) {


  edge_table e_t(_self, _self.value);
  
  auto eitr = e_t.find( hashed::concatID(fromNode, toNode, edgeName) );
  check(eitr != e_t.end(), "Edge not found");

  require_auth( has_auth(eitr->creator) ? eitr->creator : get_self() );

  e_t.erase(eitr);

}




// function will: 
// 1. Ensure the document exists
//  2. Create a new document for certificate, persisting signature and notes
//  3. Create a new edge from document_id to the newly created document

/*
  Document(get_self(), certifier,
                   ContentGroups{
                       ContentGroup{
                           Content(CONTENT_GROUP_LABEL, DETAILS),
                           Content(SIGNATURE, signature),
                           Content(NOTES, notes)},
                       ContentGroup{
                           Content(CONTENT_GROUP_LABEL, SYSTEM),
                           Content(TYPE, common::CERTIFICATE),
                           Content(NODE_LABEL, "Certified by: " + certifier.to_string())}})

*/

/*
  Certificate Doc {

      "content_groups": [

              [ 
                  { "label": "content_group_label", "value": [ "string", "system" ] }, 
                  { "label": "type", "value": [ "name", "certificate" ] }, 
                  { "label": "node_label", "value": [ "string", "Certified by: certifier" ] } 
              ],
              [
                  { "label": "content_group_label", "value": [ "string", "details" ] },
                  { "label": "signature", "value": [ "string", "certifier pkh" ] }, 
                  { "label": "notes", "value": [ "string", "certifier notes" ] }
              ]
          ]
      } 

*/

ACTION document_editor::certify (const eosio::name &certifier, 
              const uint64_t &document_id, 
              const std::string &signature, 
              const std::string &notes) {


  require_auth( has_auth(certifier) ? certifier : get_self() );

  hashed::Document document = get_node(document_id);

  hashed::ContentGroups certificate_cgs {

    hashed::ContentGroup {
      hashed::Content(hashed::CONTENT_GROUP_LABEL, DETAILS),
      hashed::Content(SIGNATURE, signature),
      hashed::Content(NOTES, notes),
      hashed::Content(HASH, document.getHash())
    },

    hashed::ContentGroup {
      hashed::Content(hashed::CONTENT_GROUP_LABEL, SYSTEM),
      hashed::Content(TYPE, graph::CERTIFICATE),
      hashed::Content(NODE_LABEL, "Certified by: " + certifier.to_string())

    }
  };


  hashed::Document certificate = hashed::Document::getOrNew( get_self(), certifier, std::move(certificate_cgs) );
  eosio::check(certificate.getCreated().sec_since_epoch() > 0, "created_date not populated when saved");

  hashed::Edge::write( get_self(), certifier, document_id, certificate.getId(), graph::CERTIFIED_BY );



}


// same as above, but this function will check that the document hashes to the 
// provided contentHash as an extra security measure
ACTION document_editor::certifyhash (const eosio::name &certifier, 
              const uint64_t &document_id, 
              const eosio::checksum256 &contentHash, 
              const std::string &signature, 
              const std::string &notes) {

  require_auth( has_auth(certifier) ? certifier : get_self() );

  hashed::Document document = get_node(document_id);

  check(document.getHash() == contentHash, "0");


  hashed::ContentGroups certificate_cgs {

    hashed::ContentGroup {
      hashed::Content(hashed::CONTENT_GROUP_LABEL, DETAILS),
      hashed::Content(SIGNATURE, signature),
      hashed::Content(NOTES, notes),
      hashed::Content(HASH, document.getHash())
    },

    hashed::ContentGroup {
      hashed::Content(hashed::CONTENT_GROUP_LABEL, SYSTEM),
      hashed::Content(TYPE, graph::CERTIFICATE),
      hashed::Content(NODE_LABEL, "Certified by: " + certifier.to_string())

    }
  };


  hashed::Document certificate = hashed::Document::getOrNew( get_self(), certifier, std::move(certificate_cgs) );
  eosio::check(certificate.getCreated().sec_since_epoch() > 0, "created_date not populated when saved");

  hashed::Edge::write( get_self(), certifier, document_id, certificate.getId(), graph::CERTIFIED_BY );

}


hashed::Document document_editor::get_node (const uint64_t &documentID) {
  document_table d_t(get_self(), get_self().value);

  auto ditr = d_t.find(documentID);
  check(ditr != d_t.end(), "Document not found");

  hashed::Document document(get_self(), ditr -> getHash());
  return document;
}



