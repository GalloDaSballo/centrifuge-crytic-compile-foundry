// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

// Chimera deps
import {BaseSetup} from "@chimera/BaseSetup.sol";
import {vm} from "@chimera/Hevm.sol";

// Managers
import {ActorManager} from "@recon/ActorManager.sol";
import {AssetManager} from "@recon/AssetManager.sol";

// Helpers
import {Utils} from "@recon/Utils.sol";

// Your deps
import "@centrifuge/hub/ShareClassManager.sol";


contract MockHubRegistry {
    function currency(PoolId pId) external pure returns (AssetId) {
        return AssetId.wrap(123);
    }
}

contract MockValuation {
    function getQuote(uint256 baseAmount, address base, address quote) external view returns (uint256 quoteAmount) {
        return baseAmount;
    }

}

abstract contract Setup is BaseSetup, ActorManager, AssetManager, Utils {
    ShareClassManager shareClassManager;
    IHubRegistry mockRegistry;
    IERC7726 valuation;

    /// === Setup === ///
    /// This contains all calls to be performed in the tester constructor, both for Echidna and Foundry
    function setup() internal virtual override {
        // New Actor, beside address(this)
        _addActor(address(0x411c3));
        _newAsset(18); // New 18 decimals token


        mockRegistry = IHubRegistry(address(new MockHubRegistry()));
        valuation = IERC7726(address(new MockValuation()));

        shareClassManager = new ShareClassManager(mockRegistry, address(this));


        // Mints to all actors and approves allowances to the counter
        address[] memory approvalArray = new address[](1);
        // approvalArray[0] = address(counter);
        _finalizeAssetDeployment(_getActors(), approvalArray, type(uint88).max);
    }

    /// === MODIFIERS === ///
    /// Prank admin and actor
    
    modifier asAdmin {
        vm.prank(address(this));
        _;
    }

    modifier asActor {
        vm.prank(address(_getActor()));
        _;
    }
}
