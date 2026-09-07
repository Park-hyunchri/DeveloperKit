# Architecture

## 기본 구조

- Model: 데이터, 도메인 규칙, 외부 데이터 표현
- View: WPF 화면과 사용자 입력 표시
- ViewModel: 화면 상태, 명령, 검증, Model 연결
- Services: 파일·DB·네트워크·장치 등 외부 연동

의존성은 View → ViewModel → Model / Services 방향을 기본으로 한다.
