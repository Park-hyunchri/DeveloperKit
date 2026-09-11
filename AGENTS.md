# AGENTS.md

## 프로젝트 자동 분석

DeveloperKit 적용 요청을 받으면

먼저 프로젝트 종류를 분석한다.

예)

- WinForms
- WPF
- MVVM
- Console
- ASP.NET
- Class Library

프로젝트 구조는 변경하지 않는다.

분석 결과에 맞는 AGENTS.md를 생성한다.

## 기본 원칙

- 항상 한국어로 답변한다.
- 작업 전 `AGENTS.md`를 먼저 읽는다.
- 운영 프로그램 기준으로 신중하게 작업한다.
- C# / WPF / MVVM 구조와 기존 코딩 스타일을 유지한다.
- 최소 수정 원칙을 적용한다.

## 작업 승인

파일 수정 전 반드시 다음을 설명하고 사용자 승인을 받는다.

1. 원인
2. 수정 파일
3. 영향 범위
4. 테스트 방법
5. 빌드 영향 범위

승인 전 파일 생성·수정·삭제를 하지 않는다.

## 금지 사항

- 불필요한 리팩터링, 자동 포맷, 네이밍 변경, 주석 변경 금지
- 불필요한 `using` 정리 금지
- 승인 없는 파일 삭제 금지
- 사용자 명시 요청 없는 Commit / Push 금지

## 표준 작업 흐름

분석 → 원인 확인 → 수정 계획 및 승인 → 최소 수정 → 빌드 → 테스트 → `WORKLOG.md` 갱신 → `CODEX_HANDOFF.md` 갱신 여부 확인 → 사용자 요청 시 Commit / Push

## 확인 명령

```text
git status
git diff
```

`reset`, `clean`, `restore`, 강제 push는 별도 승인을 받는다.

## DeveloperKit Workspace

DeveloperKit과 현재 프로젝트가 동일한 VS Code Workspace에 열려 있다고 가정한다.

사용자가

"DeveloperKit 적용해줘."

라고 요청하면

DeveloperKit 적용 요청을 받으면

1.
현재 프로젝트 종류 분석

2.
Git 저장소 여부 확인

3.
DeveloperKit 문서 존재 여부 확인

4.
없는 문서만 생성

5.
기존 문서는 덮어쓰지 않음

6.
프로젝트에 맞게 템플릿 자동 수정

7.
생성 계획 보고

8.
사용자 승인

9.
생성

10.
git diff 보고

기존 파일은 덮어쓰지 않는다.

## v1.1 템플릿 규칙

- 공통 템플릿은 `templates/common`에서 관리한다.
- 유형별 템플릿은 WinForms, WPF, ASP.NET, Console, Class Library 폴더에서 관리한다.
- 적용 전 `.csproj`를 읽기 전용으로 분석하고, 없는 파일만 생성한다.
- 대상 프로젝트의 소스, `.csproj`, NuGet, 빌드 설정은 변경하지 않는다.
