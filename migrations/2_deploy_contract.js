const SAFEToken = artifacts.require("SAFEToken");

module.exports = function (deployer) {
  deployer.deploy(SAFEToken);
};
