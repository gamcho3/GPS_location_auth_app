# GPS연동- 장소 출석체크 앱

## 개요

## 필수 기능

- 내 위치 지도에 띄우기
- 저장된 장소 지도에 띄우기
- QR코드 체크했을때 저장된 장소 체크 되기

## 기능 구현 체크리스트

- [ ] 내 위치정보 받기
- [ ] 지도API 구현 (구글맵)
- [ ] firebase 연동
- [x] google Social Login 구현

## 화면 별 구성 요소

- **home**
  - 현재 위치가 가까운 코스 리스트
  - 최신순 생성된 코스 리스트
  - 인기순 생성된 코스 리스트
  - 사용자 후기

## firebase 연동 방법

1. firebase 프로젝트 등록
2. [firebase CLI 설치 및 업데이트](https://firebase.google.com/docs/cli?hl=ko#install-cli-windows)
3. firebase login 확인 후 프로젝트 명령어 실행 (cmd에서 실행)
4. 설치 완료 후 firebase 관련 패키지 설치
