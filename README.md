# OTK

# 📸 OTK - 스마트 스크린샷 정보 정리 및 추천 앱

AI가 자동으로 스크린샷 정보를 분류하고, 위치·시간·일정에 따라 필요한 정보를 추천해주는 iOS 기반 스마트 정보 관리 앱입니다.

---

## 🧠 프로젝트 개요

**OTK(오늘의 티켓)**는 스크린샷으로 저장한 정보들을 자동으로 분류하고, 사용자의 라이프스타일(위치, 시간대, 일정)에 맞추어 **유효기간 알림**, **장소 기반 추천**, **일정 연동 알림** 등을 제공하는 **개인화 정보 추천 플랫폼**입니다.

---

## ⚙️ 기술 스택

| 구성 요소 | 기술 |
|-----------|------|
| Mobile Frontend | Swift, SwiftUI |
| Backend | Spring Boot, Firebase Functions |
| OCR & 객체 인식 | VisionKit (iOS), YOLOv8 |
| 텍스트 의미 분석 | OpenAI GPT-4 API |
| 위치 데이터 | CoreLocation |
| 시간대 사용 분석 | ScreenTime API |
| 일정 연동 | EventKit |
| AI 추천 | PyTorch (Clustering + LSTM) |
| Storage | Firebase Firestore (메타데이터 저장) |

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

- ✅ **VisionKit을 이용한 OCR 텍스트 추출**
- ✅ **YOLOv8 객체 탐지로 이미지 내 의미 있는 요소 인식**
- ✅ **GPT-4 API를 활용한 의미 기반 카테고리/태그 자동 분류**
- ✅ **Firebase에 메타데이터 저장 (이미지 제외, 개인정보 보호)**
- ✅ **CoreLocation, ScreenTime, EventKit을 통한 개인화 추천**
- ✅ **LSTM 기반 행동 예측으로 적절한 시점에 알림/추천 제공**

---

## 🚀 실행 방법

1. 본 레포를 클론
2.	Xcode로 OTKApp.xcodeproj 또는 OTKApp.xcworkspace 열기
3.	.env 또는 Info.plist에 API Key 설정
   OPENAI_API_KEY=your_api_key
4. 시뮬레이터 또는 실기기에서 실행

---

## 🧪 테스트용 시나리오
1.	앱을 실행 후 스크린샷 업로드
2.	텍스트 자동 추출 → GPT-4 API 분류 결과 확인
3.	Firebase에 저장된 태그 기반 검색 가능
4.	위치 이동/시간대 변화 시 추천 카드 또는 알림 확인

---

## 📹 시연 영상
YouTube 링크 (추후 추가 예정):

---

## 📬 팀 소개 및 문의
(추후 추가 예정)
