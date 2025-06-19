# OTK

## 📸 OTK - 스마트 스크린샷 정보 정리 및 추천 앱

AI가 자동으로 스크린샷 정보를 분석·분류하고, 위치·시간·일정 기반으로 알림과 추천을 제공하는 **iOS 기반 개인화 정보 관리 플랫폼**입니다.

---

## 🧠 프로젝트 개요

**OTK(오늘의 티켓)**는 쌓여만 가는 스크린샷 속 정보를 의미 기반으로 자동 정리하고, **사용자의 생활 맥락(위치, 시간대, 일정)**에 따라 적절한 시점에 꺼내주는 AI 서비스입니다.  
단순 저장을 넘어, **정보 활용을 실질적으로 도와주는 스마트 리마인드 시스템**을 지향합니다.

- 스크린샷 OCR 및 객체 인식
- 의미 기반 GPT-4 자동 분류
- 위치/시간/일정 기반 리마인드
- Clustering + LSTM 기반 행동 예측
- Firebase 기반 메타데이터 저장 및 검색

---

## ⚙️ 기술 스택

| 구성 요소              | 기술 스택                         |
|------------------------|------------------------------------|
| **Mobile Frontend**    | Swift, SwiftUI                    |
| **Backend**            | Firebase Functions, Spring Boot  |
| **OCR & 객체 인식**     | VisionKit (iOS), YOLOv8           |
| **텍스트 의미 분석**    | OpenAI GPT-4 API                  |
| **위치 데이터**         | CoreLocation                      |
| **사용 패턴 분석**      | UsageLogger (ScreenTime 대체)     |
| **일정 연동**           | EventKit                          |
| **AI 추천**            | PyTorch (Clustering, LSTM)       |
| **Storage**            | Firebase Firestore                |

---

## 🔍 주요 기능

### ✅ 스크린샷 정보 추출 및 자동 분류
- **VisionKit**: 이미지 내 텍스트 OCR
- **YOLOv8**: 쿠폰/지도 등 시각 정보 보완 탐지
- **GPT-4 API**: 의미 기반 카테고리 분류 및 태깅

### ✅ 개인화 추천
- **CoreLocation**: 주변 장소 기반 추천 (예: 카페 쿠폰)
- **UsageLogger**: 시간대별 사용 패턴 분석 및 알림 타이밍 최적화
- **EventKit**: 일정 전후 맥락 기반 추천 제공
- **PyTorch 기반 모델**:
  - 사용자 Clustering (예: ‘주말 외출형’)
  - LSTM 기반 Sequence Modeling (관심사 흐름 예측)

### ✅ 메타데이터 중심 저장 구조
- OCR/GPT 분석 결과는 메타데이터화하여 Firestore에 저장  
- 위치·시간·일정 데이터는 **실시간 분석 후 즉시 폐기**

---

## 🎞 시연 영상

🖥 [YouTube 시연 영상 바로가기](https://youtube.com/shorts/UFNt7KPRllA?feature=share)

### ▶️ 시청 포인트
- 스크린샷 선택 → VisionKit 기반 OCR
- GPT-4를 통한 의미 기반 분류 및 세부 정보 추출
- UI 내 개별 필드 시각화: 식당/카페 이름, 주소, 메뉴 등
- CoreLocation 기반 위치 추천 카드 노출
- Firebase 메타데이터 저장 흐름까지 확인 가능  
- 각 단계별 처리 기술 자막 삽입으로 직관적인 흐름 제공

---

## 🚀 실행 방법

1. 본 레포지토리 클론
2. `OTKApp.xcodeproj` 또는 `OTKApp.xcworkspace` 열기
3. `.env` 또는 `Info.plist`에 아래와 같이 API 키 설정
4. iOS 시뮬레이터 또는 실기기에서 실행

---

## 📬 팀 소개

**Team 강배우**

- 👩‍💻 강다혜 (팀장, Backend & AI)
- 👩‍💻 배서연 (Backend & AI)
- 👩‍🎨 우민하 (Frontend, UI/UX)

---

📝 **📁 폴더 구조 설명은 추후 추가 예정입니다.**
