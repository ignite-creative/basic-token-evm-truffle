require("dotenv").config();
const BasicToken = artifacts.require("BasicToken");

module.exports = function (deployer) {
  deployer.deploy(
    BasicToken,
    process.env.TOKEN_NAME || "",
    process.env.TOKEN_SYMBOL || "",
    process.env.TOKEN_AMOUNT || 1000000000,
    process.env.TOKEN_DECIMALS || 18
  );
};
