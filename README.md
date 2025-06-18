# OTK

# 📸 OTK - 스마트 스크린샷 정보 정리 및 추천 앱

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

| 구성 요소        | 기술 스택 |
|------------------|--------------------|
| **Mobile Frontend** | Swift, SwiftUI |
| **Backend** | Spring Boot, Firebase Functions |
| **OCR & 객체 인식** | VisionKit (iOS), YOLOv8 |
| **텍스트 의미 분석** | OpenAI GPT-4 API |
| **위치 데이터** | CoreLocation |
| **시간대 분석** | ScreenTime API |
| **일정 연동** | EventKit |
| **AI 추천** | PyTorch (Clustering, LSTM) |
| **Storage** | Firebase Firestore (메타데이터 저장 전용) |

---


## 📁 폴더 구조
OTKApp/
├── Modules/
│   ├── GPTCategory/      # OCR + GPT 분류 모듈
│   ├── CoreLocation/     # 위치 정보 수집 및 추천 조건 설정
│   ├── Calendar/         # EventKit 일정 연동 모듈
│   ├── UsageLogger/      # ScreenTime 기반 사용 패턴 분석
├── Shared/               # 공통 유틸리티, 모델 등
├── Resources/            # 이미지, 테스트 데이터 등
└── OTKApp.swift          # App entry point

---

## 🔍 주요 기능

### ✅ 정보 추출 및 분류
- **VisionKit**: 스크린샷에서 텍스트 OCR
- **YOLOv8**: 쿠폰/지도 등 시각 객체 탐지
- **GPT-4 API**: 텍스트 + 객체 정보를 의미 기반으로 자동 분류 및 태깅

### ✅ 메타데이터 저장
- **Spring**: GPT 결과 정제 및 Firebase 연동
- **Firestore**: 카테고리, 태그, 유효기간, 위치 정보 저장 (이미지 제외)

### ✅ 개인화 추천
- **CoreLocation**: 위치 기반 추천
- **ScreenTime**: 시간대별 알림 타이밍 분석
- **EventKit**: 일정 연동 알림 제공
- **PyTorch**: Clustering + LSTM 기반 사용자 행동 예측

---

## 🚀 실행 방법

1. 본 레포를 클론
2.	Xcode로 OTKApp.xcodeproj 또는 OTKApp.xcworkspace 열기
3.	.env 또는 Info.plist에 API Key 설정
   OPENAI_API_KEY=your_api_key
4. iOS 시뮬레이터 또는 실기기에서 실행

---

## 🧪 테스트 시나리오

- 앱 실행 후 스크린샷 업로드
- VisionKit OCR 결과 → GPT-4 분류 확인
- Firebase Firestore에 태그/카테고리/위치 메타데이터 저장 확인
- 위치 이동/시간대 변화 시 맞춤형 추천 카드 또는 알림 노출 확인

---

## 🎞 시연 영상

🖥 [YouTube 시연 영상 바로가기](https://www.youtube.com/shorts/oHB4caPoAj0)

> OCR → GPT 분류 → Firebase 저장 → CoreLocation 기반 추천 → UI 반영까지 전체 흐름을 시각적으로 확인할 수 있습니다.

---

## 📬 팀 소개

**Team 강배우**

- 강다혜 (팀장, Backend & AI)
- 배서연 (Backend & AI)
- 우민하 (Frontend, UI/UX)
