pragma solidity ^0.4.25;

contract MockCommitRevealContract {
  mapping (address => bytes32) commits;

  function setCommit(bytes32 _commit)
    public
  {
    commits[msg.sender] = _commit;
  }

  function verify(bool _vote, uint256 _salt)
    public
    view
    returns (bool)
  {
    require(keccak256(abi.encodePacked(msg.sender, _vote, _salt)) == commits[msg.sender]);
    return true;
  }
}
