import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("TokenBModule", (m) => {
  const initialSupply = 1000000;
  const tokenB = m.contract("TokenB", [initialSupply]);
  return { tokenB };
});
