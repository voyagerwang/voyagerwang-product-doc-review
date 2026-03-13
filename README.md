# product-review-skill

产品评审技能公开版。

目标：
1. 让 `Codex`、`Claude Code` 用户可以安装成原生 skill。
2. 保留“先还原闭环，再找落地漏洞”的评审方法。
3. 面向中后台、平台型、权限状态流转、直播后台、机构侧等复杂产品需求材料输出结构化评审意见。
4. 删除所有私有链接、本机路径、密钥和内部依赖。

## 支持目标

1. `Codex`
2. `Claude Code`

## 一键安装

```bash
curl -fsSL https://raw.githubusercontent.com/voyagerwang/product-review-skill/main/install.sh | bash
```

显式指定目标：

```bash
curl -fsSL https://raw.githubusercontent.com/voyagerwang/product-review-skill/main/install.sh | bash -s -- --target codex
curl -fsSL https://raw.githubusercontent.com/voyagerwang/product-review-skill/main/install.sh | bash -s -- --target claude
```

侧装测试，不覆盖现有同名技能：

```bash
bash install.sh --target codex --name product-review-public
```

## 安装结果

### Codex

安装到：

```text
$CODEX_HOME/skills/<skill-name>
# 或默认
~/.codex/skills/<skill-name>
```

### Claude Code

安装到：

```text
~/.claude/skills/<skill-name>
```

## 仓库结构

```text
product-review-skill/
├── README.md
├── install.sh
├── uninstall.sh
├── codex/
│   └── product-review/
├── claude-code/
│   └── product-review/
├── docs/
│   └── github-copy.md
└── scripts/
    └── check-sensitive.sh
```

## 适用场景

适合评审以下材料：
1. `PRD`
2. 需求方案
3. 功能设计
4. 原型说明
5. 上线评审材料

特别适合：
1. 中后台和平台型产品
2. 机构侧、作者体系、直播后台
3. 审批、审核、上下架、冻结解冻等状态敏感流程
4. 权限复杂、角色多、跨系统联动多的需求

## 使用方式

### Codex / Claude Code

安装后常见用法：

```text
[$product-review] 审查这份 PRD，重点看业务目标、范围边界、权限和状态流转。
[$product-review] 评审这个原型说明，输出高优先级问题、中低优先级问题和缺失项清单。
[$product-review] 审核这份上线方案，检查灰度、回滚、数据口径和异常处理是否闭环。
```

输出风格：
1. 优先暴露逻辑漏洞和落地风险。
2. 不停留在措辞润色。
3. 默认输出可直接复制到评审会或评审意见区的结构化中文结论。

## 安全说明

本仓库不包含：
1. 真实 API key
2. 私有文档链接
3. 本机绝对路径
4. 私有业务材料原文
5. 任何账户 token 或 secret

发布前请运行：

```bash
bash scripts/check-sensitive.sh
```

## 当前边界

1. 这是评审技能，不替代需求撰写技能。
2. 如果输入材料缺失关键规则，技能会明确列出“待补充信息”，不会强行编造。
3. 更偏创意发散、商业策略、市场分析类任务不属于本技能主场。
