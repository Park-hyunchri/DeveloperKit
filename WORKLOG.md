# WORKLOG

## 작업 기록

### 2026-09-07 - DeveloperKit 표준 템플릿 생성

- 목적: C# / WPF / MVVM 공통 개발 표준 저장소 생성
- 원인: 프로젝트 간 개발 규칙과 인계 문서 표준화 필요
- 수정 파일: 표준 문서 13개 및 `.vscode`, `docs` 폴더
- 수정 내용: Codex 승인 절차, Git 워크플로, 개발·인계·문서 템플릿 작성
- 영향 범위: DeveloperKit 문서 저장소에만 적용
- 빌드 결과: 소스 없는 문서 저장소로 빌드 대상 없음
- 테스트 결과: 필수 파일 목록 및 로컬 Git 상태 확인
- Git Status: 로컬 커밋 완료, 원격 push는 네트워크 제한으로 미완료
- Commit: Initial DeveloperKit templates
- Push: 미완료
- 남은 작업: GitHub 원격에 `git push -u origin main`

### YYYY-MM-DD - 작업명

- 목적:
- 원인:
- 수정 파일:
- 수정 내용:
- 영향 범위:
- 빌드 결과:
- 테스트 결과:
- Git Status:
- Commit:
- Push:
- 남은 작업:

### 2026-09-11 - DeveloperKit v1.1 구조 적용

- 목적: 신규 프로젝트 적용을 위한 유형별 템플릿과 자동 적용 도구 추가
- 원인: 기존 저장소에 유형 감지 및 누락 파일 적용 구조가 없음
- 수정 파일: `VERSION`, `README.md`, `AGENTS.md`, `APPLY_DEVELOPERKIT.md`, `WORKLOG.md`, `CODEX_HANDOFF.md`
- 생성 파일: `templates` 및 `scripts` 하위 파일
- 영향 범위: 문서·템플릿·PowerShell 도구만 변경
- 빌드 결과: 실행 소스와 프로젝트 파일이 없어 애플리케이션 빌드 없음
- 테스트 결과: PowerShell 구문 검사 및 임시 프로젝트 적용 검증 완료
- Git Status: 커밋하지 않음

### 2026-09-20 - DeveloperKit v2.0 업그레이드

- 목적: 운영 프로젝트에 필요한 공통 정책과 적용 후 점검 절차 표준화
- 원인: v1.1에 로그 보존, 배포, 자동 버전, 권장 폴더 구조, 작업 체크리스트와 통합 점검 기준이 없음
- 수정 파일: `VERSION`, 주요 안내·규칙 문서, `scripts/Apply-DeveloperKit.ps1`, 공통 개발자 템플릿
- 생성 파일: 운영 공통 표준, 프로젝트별 `배포방법.md`, 작업 체크리스트, Codex 프롬프트, `scripts/Test-DeveloperKit.ps1` 및 대응 공통 템플릿
- 영향 범위: DeveloperKit 문서·PowerShell 도구와 이후 신규 적용되는 문서에만 적용
- 빌드 결과: 제품 소스와 프로젝트 파일 변경이 없어 애플리케이션 빌드 대상 없음
- 테스트 결과: PowerShell 구문, WPF 감지, WhatIf 무변경, 16개 파일 적용, 재적용 시 미덮어쓰기, 정책 점검과 템플릿 치환 통과
- Git Status: 커밋·푸시하지 않음
- 남은 작업: 사용자 검토 후 필요 시 Commit·Push
