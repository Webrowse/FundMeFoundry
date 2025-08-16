## installing the import

`forge install smartcontractkit/chainlink-brownie-contracts@1.3.0`

You can skip the @version to get the current latest version.

@ to add the specific releave version (1.3.0 is the latest rn)

`--no-commit` flag as been depreciated, Now it is implemented by default.

If you want to add commit after install, you put `--commit` flag delibrately.


## importing imports

Tests: `import {Test} from "forge-std/Test.sol";`

Scripts: `import {Script} from "forge-std/Script.sol";`

## how to include the imports in the contract?

import {xyz} from "../src/smartContract.sol";
contract abc is xyz {}

## Compile command?

`forge script script/DeployFundMe.s.sol`

we can use various flags with it according to need, such as --rpc-url, --private-key, etc


## test the code that requires outside data

getting Sepolia RPC url from Alchemy.

Pinning it to .env file and extracting it to terminal using `source .env`.

run `forge test --fork-url $SEPOLIA_RPC_URL -vvv --match-test testPriceFeedVersionIsAccurate`

## to check how much code has been into the testing 

`forge coverage --fork-url $SEPOLIA_RPC_URL`

it will give you a table of files with percentages of how much lines out of total have been to test file.

## Make FundMe for multiple chains

Not hard coding the Address, instead passing it during initialising it.

### How to get addresses? 

Use Chain-list Price Feed Contract Addresses page. Select the network (Etheruem, ZKSync, Solana, Polygon, etc).

https://docs.chain.link/data-feeds/price-feeds/addresses?page=1&testnetPage=1

### Position matters for VM.BROADCAST

Anything above vm.broadcast(): Will be running in the simulated environment
Anything after vm.broadcast(): Will be a part of txn and will cost the gas on chain.




