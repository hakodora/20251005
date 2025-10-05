# Flutter Web Project

这是一个 Flutter Web 项目，包含自动化的 GitHub Actions 构建流程。

## 项目结构

- `Phase1_Landing_v1.0/apps/phase1_flutter/` - Flutter Web 应用
- `.github/workflows/` - GitHub Actions 工作流配置
- `docs/` - 项目文档

## 构建状态

[![Build Status](https://github.com/hakodora/20251005/actions/workflows/flutter_build_deploy.yml/badge.svg)](https://github.com/hakodora/20251005/actions)

## 本地开发

```bash
cd Phase1_Landing_v1.0/apps/phase1_flutter
flutter pub get
flutter run -d chrome
```

## 部署

项目通过 GitHub Actions 自动构建和部署。每次推送到 main 分支都会触发构建流程。

构建完成后，可以在 Actions 页面下载构建产物。