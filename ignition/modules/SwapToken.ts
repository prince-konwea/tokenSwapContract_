import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("SwapTokenModule", (m) => {
  const initialSupplyA = 1000000;
  const initialSupplyB = 1000000;
  const tokenA = m.contract("TokenA", [initialSupplyA]);
  const tokenB = m.contract("TokenB", [initialSupplyB]);
  const swapToken = m.contract("SwapToken", [tokenA, tokenB]);
  return { tokenA, tokenB, swapToken };
});
