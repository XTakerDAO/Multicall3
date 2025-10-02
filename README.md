# Multicall3 on XT Smart Chain

标准 [Multicall3](https://github.com/mds1/multicall) 合约在 XT Smart Chain (XSC) 上的部署。

## 合约信息

- **合约地址**: `0x7C17440417090D74EBdc1838402e2809886Ad5F8`
- **链**: XT Smart Chain (XSC)
- **Chain ID**: 520
- **RPC**: https://datarpc1.xsc.pub
- **Solidity 版本**: 0.8.12
- **EVM 版本**: London

## 关于 Multicall3

Multicall3 允许在单个交易中聚合多个函数调用,显著减少 RPC 调用次数并提高应用性能。

### 核心功能

- ✅ **aggregate**: 批量调用,所有调用必须成功
- ✅ **tryAggregate**: 批量调用,允许单个调用失败
- ✅ **aggregate3**: 每个调用可单独配置是否允许失败
- ✅ **aggregate3Value**: 支持携带 ETH 的批量调用
- ✅ **区块信息查询**: getBlockNumber, getChainId, getEthBalance 等工具函数

### 兼容性

- 向后兼容 Multicall 和 Multicall2
- 支持所有 EVM 兼容链

## 开发工具

本项目使用 [Foundry](https://book.getfoundry.sh/) 开发框架。

### 构建

```bash
forge build
```

### 测试

```bash
forge test
```

### 部署到 XSC

```bash
forge script script/DeployMulticall3.s.sol:DeployMulticall3 \
    --rpc-url https://datarpc1.xsc.pub \
    --private-key $PRIVATE_KEY \
    --evm-version london \
    --broadcast --legacy
```

### 使用 Cast 测试

```bash
# 获取区块号
cast call 0x7C17440417090D74EBdc1838402e2809886Ad5F8 \
  "getBlockNumber()" \
  --rpc-url https://datarpc1.xsc.pub

# 获取链 ID
cast call 0x7C17440417090D74EBdc1838402e2809886Ad5F8 \
  "getChainId()" \
  --rpc-url https://datarpc1.xsc.pub

# 查询地址余额
cast call 0x7C17440417090D74EBdc1838402e2809886Ad5F8 \
  "getEthBalance(address)" <address> \
  --rpc-url https://datarpc1.xsc.pub
```

更多测试命令参见 [TEST.md](./TEST.md)

## 参考文档

- [Multicall3 官方仓库](https://github.com/mds1/multicall)
- [Foundry 文档](https://book.getfoundry.sh/)
- [XT Smart Chain 文档](https://xsc.pub/)

## License

MIT
