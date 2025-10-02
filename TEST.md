  1. 测试基础查询函数 - getBlockNumber

  curl -X POST https://datarpc1.xsc.pub \
    -H "Content-Type: application/json" \
    -d '{
      "jsonrpc": "2.0",
      "method": "eth_call",
      "params": [{
        "to": "0x7C17440417090D74EBdc1838402e2809886Ad5F8",
        "data": "0x42cbb15c"
      }, "latest"],
      "id": 1
    }'

  函数签名: getBlockNumber() = 0x42cbb15c

  ---
  2. 测试 getChainId

  curl -X POST https://datarpc1.xsc.pub \
    -H "Content-Type: application/json" \
    -d '{
      "jsonrpc": "2.0",
      "method": "eth_call",
      "params": [{
        "to": "0x7C17440417090D74EBdc1838402e2809886Ad5F8",
        "data": "0x3408e470"
      }, "latest"],
      "id": 1
    }'

  函数签名: getChainId() = 0x3408e470

  ---
  3. 测试 getEthBalance (查询某地址余额)

  # 查询地址 0x0000000000000000000000000000000000000001 的余额
  curl -X POST https://datarpc1.xsc.pub \
    -H "Content-Type: application/json" \
    -d '{
      "jsonrpc": "2.0",
      "method": "eth_call",
      "params": [{
        "to": "0x7C17440417090D74EBdc1838402e2809886Ad5F8",
        "data": "0x4d2301cc0000000000000000000000000000000000000000000000000000000000000001"
      }, "latest"],
      "id": 1
    }'

  函数签名: getEthBalance(address) = 0x4d2301cc

  ---
  4. 验证合约是否存在

  curl -X POST https://datarpc1.xsc.pub \
    -H "Content-Type: application/json" \
    -d '{
      "jsonrpc": "2.0",
      "method": "eth_getCode",
      "params": ["0x7C17440417090D74EBdc1838402e2809886Ad5F8", "latest"],
      "id": 1
    }'

  ---
  5. 使用 cast 命令测试(更简单)

  如果安装了 Foundry,也可以使用 cast:

  # 获取区块号
  cast call 0x7C17440417090D74EBdc1838402e2809886Ad5F8 "getBlockNumber()" --rpc-url https://datarpc1.xsc.pub

  # 获取链 ID
  cast call 0x7C17440417090D74EBdc1838402e2809886Ad5F8 "getChainId()" --rpc-url https://datarpc1.xsc.pub

  # 获取当前区块时间戳
  cast call 0x7C17440417090D74EBdc1838402e2809886Ad5F8 "getCurrentBlockTimestamp()" --rpc-url https://datarpc1.xsc.pub

  # 查询某地址余额
  cast call 0x7C17440417090D74EBdc1838402e2809886Ad5F8 "getEthBalance(address)" 0x0000000000000000000000000000000000000001 --rpc-url https://datarpc1.xsc.pub

  ---
  常用函数签名参考

  | 函数                         | 签名         |
  |----------------------------|------------|
  | getBlockNumber()           | 0x42cbb15c |
  | getChainId()               | 0x3408e470 |
  | getCurrentBlockTimestamp() | 0x0f28c97d |
  | getBlockHash(uint256)      | 0xee82ac5e |
  | getEthBalance(address)     | 0x4d2301cc |
  | getLastBlockHash()         | 0x27e86d6e |

  推荐使用 cast 命令,更简洁且自动处理 ABI 编码/解码。
