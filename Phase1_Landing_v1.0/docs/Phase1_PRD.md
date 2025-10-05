# Phase 1 - iBrushPal 爱伢伴: 用户管理模块 PRD

目标
- 实现用户管理模块：注册/登录、个人资料、家庭成员管理、权限与隐私设置、数据最小化与安全合规基础。
- 输出数据模型初稿、API要点、Flutter 页面骨架、本地缓存设计、CodeBuddy 提示模板、验收清单。
- 确保与后续阶段接口契合、权限控制与数据流清晰可追溯。

核心实体与关系
- User: user_id, email, phone, password_hash, status, created_at, updated_at
- Profile: user_id, display_name, avatar_url, language, locale, privacy_settings
- Family: family_id, owner_user_id, created_at, updated_at
- FamilyMember: member_id, family_id, user_id, relation, role, permissions, joined_at
- PrivacySetting: user_id, data_minimization_level, share_with_third_parties, data_retention_policy
- Session: session_id, user_id, token_hash, device_info, created_at, expires_at
- AuditLog: audit_id, user_id, action, target, timestamp, outcome

API要点（阶段1初稿）
- 用户与认证
  - POST /auth/register
  - POST /auth/login
  - POST /auth/logout
  - POST /auth/refresh
  - POST /auth/2fa/setup
- 用户与个人资料
  - GET /users/{user_id}
  - PATCH /users/{user_id}
  - PUT /users/{user_id}/avatar
- 家庭与成员
  - GET /families/{family_id}/members
  - POST /families/{family_id}/members
  - PATCH /families/{family_id}/members/{member_id}
  - DELETE /families/{family_id}/members/{member_id}
- 隐私与设置
  - GET /users/{user_id}/privacy
  - PATCH /users/{user_id}/privacy
  - GET /users/{user_id}/preferences
  - PATCH /users/{user_id}/preferences
- 安全与审计
  - GET /audit/logs?user_id={id}&from={ts}&to={ts}
  - POST /security/activate-2fa

数据迁移与版本管理
- 数据模型变更记录、向后兼容策略

UI/UX 指引
- 登录/注册、多语言支持、隐私提示清晰
- 个人资料页：卡片式、头像上传、编辑入口
- 家庭成员页：列表/卡片混合、增删改入口清晰
- 隐私与权限页：开关控件、帮助文本简短
- 安全设置页：2FA 设置入口、密钥备份引导

CodeBuddy 交互模板（阶段1要点）
- 任务：实现阶段1的后端 API、前端界面与本地缓存骨架，建立数据模型
- 详细需求：API契约、数据库表/模型、Flutter 页面与状态管理、初步本地缓存与同步策略
- 用户流程：注册/登录 -> 编辑个人资料 -> 创建/管理家庭成员 -> 设置隐私与权限
- UI要求：登录/注册、资料编辑、家庭成员管理、隐私设置四大界面
- 技术规格：数据模型设计、接口契约、鉴权、加密、缓存与迁移
- 参考资料：CodeBuddy 开发指南、阶段1 草案
- 测试验收标准：注册/登录无错误，资料可编辑并保存，家庭成员增删改，隐私设置持久化生效；本地缓存与云端初步同步可用

测试与验收
- 功能测试：注册、登录、登出、个人资料编辑、家庭成员增删改、隐私设置保存
- 兼容性与性能：启动时间、登录响应、资料加载时间基线
- 安全性：密码哈希、传输加密、会话安全性初步评估、审计日志可用
- 验收标准：全部用例通过，数据流与权限控制一致

数据迁移与版本管理初步计划
- 字段演进、迁移步骤、回滚策略、向后兼容性设计

版本控制与交付约定
- v1.0.0-Phase1

交付格式
- Phase1_Landing_v1.0.md
- docs/schema_and_api/phase1_schema.yaml
- apps/phase1_flutter/（骨架代码入口点）
- prompts/phase1/CodeBuddy_prompts.md
- tests/phase1/test_cases.md
- migration/phase1/plan.md