# DeveloperKit v2.0

이 저장소는 모든 프로젝트의 표준 개발환경이다.

Codex가 "DeveloperKit 적용해줘." 라는 요청을 받으면 아래 절차를 따른다.

1. 현재 프로젝트를 검사한다.
2. DeveloperKit 표준과 비교한다.
3. 없는 파일만 생성 대상으로 선정한다.
4. 기존 파일은 절대 덮어쓰지 않는다.
5. 생성 계획을 먼저 보고한다.
6. 사용자 승인 후 생성한다.
7. 프로젝트 소스는 수정하지 않는다.
8. csproj, NuGet, 빌드 설정은 수정하지 않는다.
9. 생성 후 git diff 기준으로 변경 내용을 보고한다.
C# / WPF / MVVM 운영 프로젝트를 위한 공통 개발 규칙과 문서 템플릿입니다.

## 포함 내용

- Codex 작업 규칙과 승인 절차
- 작업 로그 및 인계 문서
- 개발 상태 기록
- 개발자 가이드
- 아키텍처·변경 이력·문제 해결·고객별 커스터마이징 문서

프로젝트에 복사한 뒤 각 프로젝트의 실제 구조와 환경에 맞게 내용을 보완하세요.

## v2.0 주요 표준

- 운영 로그는 최대 6개월 보관하고 애플리케이션 소유 로그만 자동 정리
- 프로젝트마다 `배포방법.md`로 빌드·게시·복구 절차 관리
- 빌드·게시 시 Git 태그 기반 버전을 자동 주입하고 결과물의 버전 추적 가능성 확보
- `src`, `tests`, `docs`, `scripts`, `deploy` 중심의 권장 최상위 폴더 구조 제공
- 작업 전·후 확인을 위한 `WORK_CHECKLIST.md`와 `CODEX_PROMPT.md` 제공
- 적용 후 누락 문서와 핵심 정책을 읽기 전용으로 확인하는 점검 도구 제공

이 표준은 신규 또는 정비 가능한 프로젝트에 대한 권장안입니다. 기존 프로젝트에 적용할 때는 현재 구조를 변경하지 않고 문서만 생성합니다.

## v2.0 구조

- `templates/common`: 공통 문서 및 VS Code 설정
- `templates/winforms`, `wpf`, `aspnet`, `console`, `classlibrary`: 프로젝트 유형별 규칙
- `scripts`: 유형 감지, 기존 파일을 덮어쓰지 않는 적용 도구, 읽기 전용 점검 도구

버전은 `VERSION`에서 관리합니다.

## 도구 사용

```powershell
.\scripts\Apply-DeveloperKit.ps1 -ProjectPath <대상경로> -DeveloperKitPath <DeveloperKit경로> -WhatIf
.\scripts\Apply-DeveloperKit.ps1 -ProjectPath <대상경로> -DeveloperKitPath <DeveloperKit경로>
.\scripts\Test-DeveloperKit.ps1 -ProjectPath <대상경로> -DeveloperKitPath <DeveloperKit경로>
```

적용 전에는 항상 `-WhatIf` 결과를 검토하고 승인을 받은 뒤 실행합니다.
