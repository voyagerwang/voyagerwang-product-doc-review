# GitHub 发布文案

## 仓库简介（About）

产品评审技能公开版。用于系统化评审中后台、平台型、权限状态流转类需求文档，输出可直接用于评审会的结构化风险结论。

## 仓库描述（Description）

Structured product review skill for PRDs, feature specs, prototype notes, and launch review materials. Focuses on goals, scope, permissions, state flows, edge cases, and delivery risk.

## Topics 建议

```text
product-review
prd-review
product-management
requirements-review
codex
claude-code
prompt-engineering
skill
```

## 首发说明（Release Notes）

### v0.1.0

公开版首发，包含：
1. `Codex / Claude Code` 原生 skill 安装。
2. 面向中后台、平台型、机构侧、直播后台、权限状态流转场景的系统化评审框架。
3. 固定输出模板，适合直接复制到评审意见区或评审会结论。
4. 对高优先级问题、中低优先级问题、缺失项和评审会讨论点的结构化输出。
5. 已移除私有材料、敏感配置和本机路径依赖。

适用场景：
1. 审查 PRD、需求方案、功能设计和原型说明。
2. 检查权限、状态机、数据口径、异常处理和上线依赖。
3. 在正式进入开发前暴露会阻塞交付的规则漏洞。

当前边界：
1. 不替代需求撰写和原型生成技能。
2. 当输入缺失关键信息时，默认输出“待补充信息”，不编造规则。
3. 更偏商业策略、增长方案和市场分析类任务不属于本技能重点。
