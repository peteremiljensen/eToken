pragma solidity 0.4.24;

import "../token/ERC20/Storage.sol";
import "../token/EToken.sol";
import "../token/IETokenProxy.sol";
import "./PauserRoleMock.sol";

/** @title Mock contract for testing EToken */
contract ETokenMock is EToken, PauserRoleMock {

    /**
     * Initializes an EToken contract and optionally mint some amount to a
     * given account
     * @param name The name of the token
     * @param symbol The symbol of the token
     * @param decimals The number of decimals of the token
     * @param accesslist Address of a deployed whitelist contract
     * @param whitelistEnabled Create token with whitelist enabled
     * @param stor Address of a deployed ERC20 storage contract
     * @param mintingRecip The initial minting recipient for the token
     * @param upgradedFrom The token contract that this contract upgrades. Set
     * to address(0) for initial deployments
     * @param initialDeployment Set to true if this is the initial deployment of
     * the token. Acts as a confirmation of intention which interlocks
     * upgradedFrom as follows: If initialDeployment is true, then
     * upgradedFrom must be the zero address. Otherwise, upgradedFrom must not
     * be the zero address.
     * @param initialAccount The account that should be minted to upon creation.
     * set to 0 for no minting
     * @param initialBalance If minting upon creation, this balance will be minted
     */
    constructor(
        string name,
        string symbol,
        uint8 decimals,
        Accesslist accesslist,
        bool whitelistEnabled,
        Storage stor,
        address mintingRecip,
        IETokenProxy upgradedFrom,
        bool initialDeployment,
        address initialAccount,
        uint256 initialBalance
    )
        EToken(
            name, symbol, decimals,
            accesslist, whitelistEnabled, stor, mintingRecip, upgradedFrom,
            initialDeployment
        )
        public
    {
        if (initialAccount != address(0)) {
            _mint(initialAccount, initialBalance);
        }
    }

}