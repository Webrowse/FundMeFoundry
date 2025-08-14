### installing the import

`forge install smartcontractkit/chainlink-brownie-contracts@1.3.0`

You can skip the @version to get the current latest version.

@ to add the specific releave version (1.3.0 is the latest rn)

`--no-commit` flag as been depreciated, Now it is implemented by default.

If you want to add commit after install, you put `--commit` flag delibrately.


### importing imports

Tests: `import {Test} from "forge-std/Test.sol";`

Scripts: `import {Script} from "forge-std/Script.sol";`

