# APPLY_DEVELOPERKIT.md

DeveloperKit은 현재 Workspace에 열려 있다고 가정한다.

DeveloperKit v1.1에서는 `.csproj`를 읽기 전용으로 분석하여 프로젝트 유형을 판별하고 `templates/common`과 해당 유형 템플릿을 사용한다.

Codex 적용 규칙

"DeveloperKit 적용해줘."

라는 요청을 받으면 다음 절차를 수행한다.

## 1

현재 프로젝트를 검사한다.

## 2

DeveloperKit과 비교한다.

## 3

다음 파일이 없으면 생성 대상으로 표시한다.

- AGENTS.md
- WORKLOG.md
- CODEX_HANDOFF.md
- DEV_STATE.md
- README_DEVELOPER.md
- .vscode/settings.json
- .vscode/extensions.json
- docs/Architecture.md
- docs/ChangeHistory.md
- docs/Troubleshooting.md
- docs/Customer_Customizing.md

## 4

기존 파일은 덮어쓰지 않는다.

## 5

생성 계획을 먼저 보고한다.

## 6

사용자가 승인하면 생성한다.

## 7

프로젝트 소스는 수정하지 않는다.

## 8

csproj는 수정하지 않는다.

## 9

NuGet은 수정하지 않는다.

## 10

생성 후 git diff 기준으로 변경 내용을 보고한다.

필요한 경우 `scripts/Apply-DeveloperKit.ps1`을 사용한다. 이 도구는 없는 파일만 생성하며 소스, `.csproj`, NuGet, 빌드 설정은 변경하지 않는다.
