# APPLY_DEVELOPERKIT.md

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