#include <eosio/eosio.hpp>
#include <eosio/asset.hpp>
#include <eosio/system.hpp>

using namespace eosio;

namespace graph {

  // document type
  static constexpr name DOCUMENT = name("document");

  // graph edges
  static constexpr name VARIABLE = name("variable");
  
  static constexpr name OWNED_BY = name("ownedby");
  static constexpr name OWNS = name("owns");

  static constexpr name FORKED = name("forked");

  static constexpr name CERTIFIED_BY = name("certified.by");

  #define NOT_FOUND -1

  // labels

  // vanilla
  #define SYSTEM "system"
  #define DETAILS "details"

  #define NODE_LABEL "node_label"


  #define TYPE "type"
  #define SIGNATURE "signature"
  #define NOTES "notes"
  #define CERTIFICATE "certificate"


  // 

  #define CREATOR "creator"
  #define EXTENDED_OF "extended_of"
  #define FIXED_DETAILS "fixed_details"
  #define DETAILS "fixed_details"
  #define IDENTIFIER_DETAILS "identifier_details"
  #define NODE_ID "node_id"
  #define OWNER "owner"
  #define TITLE "title"
  #define VARIABLE_DETAILS "variable_details"
  
}
