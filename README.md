# 프로젝트 트리
- src
	- data
		- 데이터 입출력 관련
	- domain
		- 비즈니스 로직 관련
	- presenter
		- UI관련
		- 프레임워크, 컨트롤러
	- base
		- abstract class, utils 관련
	- config
		- 앱 테마, route 관련
	- injector.dart
		- 앱 di
- main.dart
	- 앱 시작 파일

# Commit 규칙
- feat: 기능 추가, 삭제, 변경(or ✨ emoji) - 제품 코드 수정 발생
- fix: 버그 수정(or 🐛 emoji) - 제품 코드 수정 발생
- docs: 문서 추가, 삭제, 변경(or 📝 emoji) - 코드 수정 없음
- style: 앱 디자인 관련사항 변경(or 💎 emoji) - 제품 코드 수정 발생, 하지만 동작에 영향을 주는 변경은 없음
- refactor: 코드 리펙토링, eg. renaming a variable(or ♻️ emoji) - 제품코드 수정 발생
- test: 테스트 코드 추가, 삭제, 변경 등(or 🧪 emoji) - 제품 코드 수정 없음. 테스트 코드에 관련된 모든 변경에 해당
- chore: 위에 해당하지 않는 모든 변경(or 🧹 emoji), eg. 빌드 스크립트 수정, 패키지 배포 설정 변경 - 코드 수정 없음
= build: yarn과 관련된 빌드 시스템의 변경(or 🏗️ emoji), eg. 패키지 설치
