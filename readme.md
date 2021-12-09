# Document graph eosio


Document graph smart contracts 


# Setup

### Git

To setup the submodules just run the following commands:

```
git submodule init
git submodule update
```

Compile & test files from submodule ( description in document-graph/readme.md or https://github.com/hashed-io/document-graph )

# How to Build -
	- cd to 'build' directory
  - run the command 'cmake ..'
  - run the command 'make'

# After build -
  - The built smart contract is under the 'document_editor' directory in the 'build' directory
  - You can then do a 'set contract' action with 'cleos' and point in to the './build/document_editor' directory

Additions to CMake should be done to the CMakeLists.txt in the './src' directory and not in the top level CMakeLists.txt

# Test contract