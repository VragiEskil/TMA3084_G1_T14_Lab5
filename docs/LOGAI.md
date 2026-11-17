# AI Usage Log — StudentHub Flutter Application

**Branch:** `feature/102387`  
**Date:** November 2026  

## Overview
AI assistance (Gemini) was utilized during the development, debugging, and CI/CD stabilization phases of the **StudentHub** application. All AI-generated suggestions were manually reviewed, tested locally, and verified through automated GitHub Actions workflows (`dart format`, `flutter analyze`, and `flutter test`).

---

## Interaction & Debugging Log

### 1. Widget Testing & State Management (`Provider`)
* **Issue:** `flutter test` failed with a `ProviderNotFoundException` when rendering the widget tree in `test/widget_test.dart`.
* **Prompt Summary:** Shared test failure stack trace and asked how to properly inject `AppState` into the test environment.
* **Resolution:** Wrapped the root test widget inside `ChangeNotifierProvider<AppState>` so widget tests could access application state without runtime errors.

### 2. Static Analysis & Linter Compliance (`flutter analyze`)
* **Issue:** `flutter analyze` flagged unused imports (`package:flutter/material.dart` in `test/widget_test.dart`), `unnecessary_underscores` in `student_info.dart`, and experimental SDK deprecation warnings.
* **Prompt Summary:** Provided analyzer warning logs and requested clean fixes aligned with strict lint rules.
* **Resolution:** Removed unused imports, cleaned up underscore parameter naming, and configured `analysis_options.yaml` appropriately.

### 3. CI/CD Formatting & Line-Ending Normalization (`dart format`)
* **Issue:** GitHub Actions failed on `dart format --output=none --set-exit-if-changed .` with exit code 1 due to formatting discrepancies and Windows CRLF vs. Linux LF line-ending mismatches in `lib/pages/student_records_page.dart`.
* **Prompt Summary:** Shared CI exit code 1 output and asked why formatting kept reverting between local and remote environments.
* **Resolution:** Configured `git config core.autocrlf input`, normalized repository line endings, applied `dart format .`, and verified clean status prior to pushing.