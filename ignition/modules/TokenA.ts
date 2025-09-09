import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("TokenAModule", (m) => {
  const initialSupply = 1000000;
  const tokenA = m.contract("TokenA", [initialSupply]);
  return { tokenA };
});
