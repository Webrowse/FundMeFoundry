# Foundry + Chainlink Notes

## Installing Imports
forge install smartcontractkit/chainlink-brownie-contracts@1.3.0  
- @version can be skipped to always pull the latest  
- --no-commit is now default (deprecated flag)  
- If you want to commit after installing, explicitly add --commit  

---

## Importing Files
Tests: import {Test} from "forge-std/Test.sol";  
Scripts: import {Script} from "forge-std/Script.sol";  
Contracts:  
import {XYZ} from "../src/SmartContract.sol";  
contract ABC is XYZ {}  

---

## Compile Command
forge script script/DeployFundMe.s.sol  
- Add flags as needed: --rpc-url, --private-key, etc  

---

## Testing with External Data
- Get Sepolia RPC URL (e.g., from Alchemy)  
- Store in .env and load with: source .env  
- Run test:  
forge test --fork-url $SEPOLIA_RPC_URL -vvv --match-test testPriceFeedVersionIsAccurate  

---

## Code Coverage
forge coverage --fork-url $SEPOLIA_RPC_URL  

---

## Multi-Chain Deployment
- Avoid hardcoding addresses. Pass them during initialization  
- Get addresses from Chainlink registry:  
https://docs.chain.link/data-feeds/price-feeds/addresses?page=1&testnetPage=1  

---

## VM.broadcast()
- Code before vm.broadcast() runs in simulated environment  
- Code after vm.broadcast() is sent as a real transaction (consumes gas)  

---

## Cheatcodes (Foundry)
vm.expectRevert(); → expects next line to fail  
- Ignores vm.prank(...)  

Prank (fake address):  
address USER = makeAddr("user");  
vm.deal(USER, START_FUND); // Give balance to USER  

START_FUND can be set as uint256 START_FUND = 10e18;  

Simulate gas price: txGasPrice  

---

## Running Specific Tests
forge test --match-test testFundFailsWithoutEnoughEth  

---

## Gas Efficiency
- Make state variables private  
- Expose them with external view/pure functions  
- Saves gas  

---

## Test Lifecycle
Each test runs with a fresh setup:  
setUp() → testA()  
setUp() → testB()  

Pattern: Arrange → Act → Assert  

---

## Gas in Local Tests
- Local environment defaults to gas price = 0  
- Measure gas usage:  
forge snapshot --match-test testWithdrawFromMultipleFunders  

Built-ins:  
gasleft() → remaining gas  
tx.gasprice → current gas price  

---

## Storage & Memory
Inspect storage layout:  
forge inspect FundMe storageLayout  

Constants are stored directly in bytecode  

Check storage slot data:  
cast storage <contract_address> <slot_number>  

Example:  
cast storage 0x0002322ws2232kbe2 2  

If slot not given, defaults to fetching from Etherscan  
