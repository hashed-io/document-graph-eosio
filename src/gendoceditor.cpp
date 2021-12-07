#include <gendoceditor.hpp>

#include "document_graph/content.cpp"
#include "document_graph/document.cpp"
#include "document_graph/edge.cpp"
#include "document_graph/util.cpp"
#include "document_graph/content_wrapper.cpp"
#include "document_graph/document_graph.cpp"

ACTION gendoceditor::reset () {
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


ACTION gendoceditor::createdoc (const name &creator) {

  require_auth( has_auth(creator) ? creator : get_self() );

  // creates the node
  hypha::ContentGroup document_node {
    hypha::ContentGroup {
      hypha::Content(hypha::CONTENT_GROUP_LABEL, FIXED_DETAILS),
      hypha::Content(TYPE, graph::DOCUMENT),
      hypha::Content(OWNER, creator)
    }
  };

  hypha::Document document(get_self(), creator, std::move(document_node));
  
}

ACTION gendoceditor::editdoc (const uint64_t &documentID, hypha::ContentGroups &content_groups) {

  hypha::Document document = get_node(documentID);

  hypha::ContentWrapper document_content = document.getContentWrapper();

  name owner = document_content.getOrFail(FIXED_DETAILS, OWNER) -> getAs<name>();
  
  require_auth( has_auth(owner) ? owner : get_self() );

  hypha::ContentGroups & doc_cg = document.getContentGroups();

  doc_cg = content_groups;

  document.modify();

}

ACTION gendoceditor::extenddoc (const name &creator, const uint64_t &fromNode) { // (creates a new document and a new edge)
  
  require_auth( has_auth(creator) ? creator : get_self() );

  hypha::Document document = get_node(fromNode);

  hypha::ContentWrapper document_content = document.getContentWrapper();

  name owner = document_content.getOrFail(FIXED_DETAILS, OWNER) -> getAs<name>();

  hypha::ContentGroup document_node {
    hypha::ContentGroup {
      hypha::Content(hypha::CONTENT_GROUP_LABEL, FIXED_DETAILS),
      hypha::Content(TYPE, graph::DOCUMENT),
      hypha::Content(OWNER, creator),
      hypha::Content(EXTENDED_OF, owner),
    }
  };

  hypha::Document deltas(get_self(), creator, std::move(document_node));

  deltas.merge(document, deltas);

  m_documentGraph.replaceNode(fromNode, deltas.getId());

  hypha::Edge::write(get_self(), creator, fromNode, deltas.getId(), graph::FORKED);


}
 
ACTION gendoceditor::deletedoc (const uint64_t &documentID) {

  
  document_table d_t(_self, _self.value);
  
  auto ditr = d_t.find(documentID);
  check(ditr != d_t.end(), "Document not found");

  hypha::Document document = get_node(documentID);

  hypha::ContentWrapper document_content = document.getContentWrapper();

  name creator = document_content.getOrFail(FIXED_DETAILS, OWNER) -> getAs<name>();
  
  require_auth( has_auth(creator) ? creator : get_self() );

  m_documentGraph.removeEdges(documentID);
  d_t.erase(ditr);


}

ACTION gendoceditor::createedge (const name &creator, const uint64_t &fromNode, const uint64_t &toNode, const name &edgeName) {
  

  document_table d_t(_self, _self.value);
  
  auto dfitr = d_t.find(fromNode);
  check(dfitr != d_t.end(), "First document not found");

  auto dtitr = d_t.find(toNode);
  check(dtitr != d_t.end(), "Second document not found");

  require_auth( creator);

  hypha::Edge::write(get_self(), creator, fromNode, toNode, edgeName);

}

ACTION gendoceditor::deleteedge (const uint64_t &fromNode, const uint64_t &toNode, const name &edgeName) {

  edge_table e_t(_self, _self.value);
  
  auto eitr = e_t.find( hypha::concatID(fromNode, toNode, edgeName) );
  check(eitr != e_t.end(), "Edge not found");

  require_auth( has_auth(eitr->creator) ? eitr->creator : get_self() );

  e_t.erase(eitr);

}


hypha::Document gendoceditor::get_node (const uint64_t &documentID) {
  document_table d_t(get_self(), get_self().value);

  auto ditr = d_t.find(documentID);
  check(ditr != d_t.end(), "Document not found");

  hypha::Document document(get_self(), ditr -> getHash());
  return document;
}

