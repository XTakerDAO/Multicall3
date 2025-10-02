# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

这是一个 Multicall3 智能合约项目,使用 Foundry 开发框架。Multicall3 允许在单个交易中聚合多个函数调用,与 Multicall 和 Multicall2 向后兼容。

## Development Commands

### Build & Compile
```bash
forge build
```

### Testing
```bash
# 运行所有测试
forge test

# 运行特定测试(使用 match 参数)
forge test --match-test testFunctionName

# 运行带详细输出的测试
forge test -vvv

# 运行带 gas 报告的测试
forge test --gas-report
```

### Code Formatting
```bash
forge fmt
```

### Gas Snapshots
```bash
forge snapshot
```

### Deployment

使用部署脚本部署 Multicall3 合约:

```bash
# 需要在 .env 文件中配置 PRIVATE_KEY 和 RPC_URL
forge script script/DeployMulticall3.s.sol:DeployMulticall3 --rpc-url $RPC_URL --broadcast --verify
```

部署脚本位于 `script/DeployMulticall3.s.sol`,会从环境变量读取私钥。

### Local Development Node
```bash
anvil
```

## Architecture

### Core Contract: Multicall3.sol

位于 `src/Multicall3.sol`,这是项目的核心合约,实现了:

1. **聚合调用方法**:
   - `aggregate()`: Multicall v1 向后兼容,要求所有调用成功
   - `tryAggregate()`: Multicall v2 兼容,允许单个调用失败
   - `aggregate3()`: 新版本,每个调用可单独配置是否允许失败
   - `aggregate3Value()`: 支持携带 ETH value 的批量调用

2. **数据结构**:
   - `Call`: 基础调用结构 (target, callData)
   - `Call3`: 支持失败标志 (target, allowFailure, callData)
   - `Call3Value`: 支持 ETH 转账 (target, allowFailure, value, callData)
   - `Result`: 返回结果 (success, returnData)

3. **区块信息查询方法**:
   - getBlockHash/Number/Timestamp 等工具函数
   - getEthBalance: 查询地址余额
   - getChainId: 获取链 ID

### Gas Optimization Details

- 所有 aggregate 方法标记为 `payable` 以节省每次调用 24 gas
- 使用 `unchecked` 块优化计数器递增
- aggregate3/aggregate3Value 使用内联汇编进行错误处理以优化 gas

### Solidity Version

项目使用 Solidity 0.8.12 编译核心合约,部署脚本使用 ^0.8.20。

## Important Notes

- 合约已部署在多个链上,修改时需要保持向后兼容性
- aggregate3Value 中有重要的 value 累加检查,防止 msg.value 不匹配
- 使用 Foundry 的 forge-std 库进行测试和脚本编写
