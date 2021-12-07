#include <eosio/asset.hpp>
#include <eosio/eosio.hpp>
#include <eosio/system.hpp>
#include <eosio/singleton.hpp>

#include <graph_common.hpp>
#include <document_graph/content.hpp>
#include <document_graph/document.hpp>
#include <document_graph/edge.hpp>
#include <document_graph/util.hpp>
#include <document_graph/content_wrapper.hpp>
#include <document_graph/document_graph.hpp>

using namespace eosio;

using std::string;

typedef std::variant<asset, string, time_point, name, int64_t> ContentVariant;

CONTRACT gendoceditor : public contract {

  public:
    using contract::contract;
    gendoceditor(name receiver, name code, datastream<const char*> ds)
      : contract(receiver, code, ds)
        {}
    
    DECLARE_DOCUMENT_GRAPH(gendoceditor)

    ACTION reset ();
    ACTION createdoc (const name &creator);
    ACTION editdoc (const uint64_t &documentID, hypha::ContentGroups &content_groups);
    ACTION extenddoc (const name &creator, const uint64_t &fromNode);
    ACTION deletedoc (const uint64_t &documentID);
    ACTION createedge (const name &creator, const uint64_t &fromNode, const uint64_t &toNode, const name &edgeName);
    ACTION deleteedge (const uint64_t &fromNode, const uint64_t &toNode, const name &edgeName);

  private:

    hypha::DocumentGraph m_documentGraph = hypha::DocumentGraph(get_self());

    hypha::Document get_node (const uint64_t &documentID);

};

extern "C" void apply(uint64_t receiver, uint64_t code, uint64_t action) {
  switch (action) {
    EOSIO_DISPATCH_HELPER(gendoceditor, (reset)
      (createdoc)(editdoc)(extenddoc)(deletedoc)(createedge)(deleteedge)
    )
  }
}
