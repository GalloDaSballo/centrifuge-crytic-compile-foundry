// SPDX-License-Identifier: GPL-2.0
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "../BeforeAfter.sol";
import {Properties} from "../Properties.sol";
// Chimera deps
import {vm} from "@chimera/Hevm.sol";

// Helpers
import {Panic} from "@recon/Panic.sol";

// Types
import "@centrifuge/hub/ShareClassManager.sol";


abstract contract AdminTargets is
    BaseTargetFunctions,
    Properties
{
    /// CUSTOM TARGET FUNCTIONS - Add your own target functions here ///


    /// AUTO GENERATED TARGET FUNCTIONS - WARNING: DO NOT DELETE OR MODIFY THIS LINE ///

    function shareClassManager_addShareClass(PoolId poolId, string memory name, string memory symbol, bytes32 salt, bytes memory ) public asAdmin {
        shareClassManager.addShareClass(poolId, name, symbol, salt, bytes(""));
    }

    function shareClassManager_approveDeposits(PoolId poolId, ShareClassId scId_, uint128 maxApproval, AssetId paymentAssetId) public asAdmin {
        shareClassManager.approveDeposits(poolId, scId_, maxApproval, paymentAssetId, valuation);
    }

    function shareClassManager_approveRedeems(PoolId poolId, ShareClassId scId_, uint128 maxApproval, AssetId payoutAssetId) public asAdmin {
        shareClassManager.approveRedeems(poolId, scId_, maxApproval, payoutAssetId);
    }

    function shareClassManager_cancelDepositRequest(PoolId poolId, ShareClassId scId_, bytes32 investor, AssetId depositAssetId) public asAdmin {
        shareClassManager.cancelDepositRequest(poolId, scId_, investor, depositAssetId);
    }

    function shareClassManager_cancelRedeemRequest(PoolId poolId, ShareClassId scId_, bytes32 investor, AssetId payoutAssetId) public asAdmin {
        shareClassManager.cancelRedeemRequest(poolId, scId_, investor, payoutAssetId);
    }

    function shareClassManager_claimDeposit(PoolId poolId, ShareClassId scId_, bytes32 investor, AssetId depositAssetId) public asAdmin {
        shareClassManager.claimDeposit(poolId, scId_, investor, depositAssetId);
    }

    function shareClassManager_claimDepositUntilEpoch(PoolId poolId, ShareClassId scId_, bytes32 investor, AssetId depositAssetId, uint32 endEpochId) public asAdmin {
        shareClassManager.claimDepositUntilEpoch(poolId, scId_, investor, depositAssetId, endEpochId);
    }

    function shareClassManager_claimRedeem(PoolId poolId, ShareClassId scId_, bytes32 investor, AssetId payoutAssetId) public asAdmin {
        shareClassManager.claimRedeem(poolId, scId_, investor, payoutAssetId);
    }

    function shareClassManager_claimRedeemUntilEpoch(PoolId poolId, ShareClassId scId_, bytes32 investor, AssetId payoutAssetId, uint32 endEpochId) public asAdmin {
        shareClassManager.claimRedeemUntilEpoch(poolId, scId_, investor, payoutAssetId, endEpochId);
    }

    function shareClassManager_decreaseShareClassIssuance(PoolId poolId, ShareClassId scId_, D18 navPerShare, uint128 amount) public asAdmin {
        shareClassManager.decreaseShareClassIssuance(poolId, scId_, navPerShare, amount);
    }

    function shareClassManager_deny(address user) public asAdmin {
        shareClassManager.deny(user);
    }

    function shareClassManager_file(bytes32 what, address data) public asAdmin {
        shareClassManager.file(what, data);
    }

    function shareClassManager_increaseShareClassIssuance(PoolId poolId, ShareClassId scId_, D18 navPerShare, uint128 amount) public asAdmin {
        shareClassManager.increaseShareClassIssuance(poolId, scId_, navPerShare, amount);
    }

    function shareClassManager_issueShares(PoolId poolId, ShareClassId scId_, AssetId depositAssetId, D18 navPerShare) public asAdmin {
        shareClassManager.issueShares(poolId, scId_, depositAssetId, navPerShare);
    }

    function shareClassManager_issueSharesUntilEpoch(PoolId poolId, ShareClassId scId_, AssetId depositAssetId, D18 navPerShare, uint32 endEpochId) public asAdmin {
        shareClassManager.issueSharesUntilEpoch(poolId, scId_, depositAssetId, navPerShare, endEpochId);
    }

    function shareClassManager_rely(address user) public asAdmin {
        shareClassManager.rely(user);
    }

    function shareClassManager_requestDeposit(PoolId poolId, ShareClassId scId_, uint128 amount, bytes32 investor, AssetId depositAssetId) public asAdmin {
        shareClassManager.requestDeposit(poolId, scId_, amount, investor, depositAssetId);
    }

    function shareClassManager_requestRedeem(PoolId poolId, ShareClassId scId_, uint128 amount, bytes32 investor, AssetId payoutAssetId) public asAdmin {
        shareClassManager.requestRedeem(poolId, scId_, amount, investor, payoutAssetId);
    }

    function shareClassManager_revokeShares(PoolId poolId, ShareClassId scId_, AssetId payoutAssetId, D18 navPerShare) public asAdmin {
        shareClassManager.revokeShares(poolId, scId_, payoutAssetId, navPerShare, valuation);
    }

    function shareClassManager_revokeSharesUntilEpoch(PoolId poolId, ShareClassId scId_, AssetId payoutAssetId, D18 navPerShare, uint32 endEpochId) public asAdmin {
        shareClassManager.revokeSharesUntilEpoch(poolId, scId_, payoutAssetId, navPerShare, valuation, endEpochId);
    }

    function shareClassManager_updateMetadata(PoolId poolId, ShareClassId scId_, string memory name, string memory symbol, bytes32 salt, bytes memory ) public asAdmin {
        shareClassManager.updateMetadata(poolId, scId_, name, symbol, salt, bytes(""));
    }
}