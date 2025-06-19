import SwiftUI
import UIKit
import Vision
import PhotosUI

struct ContentView: View {
    @State private var selectedImage: UIImage?
    @State private var recognizedText: [String] = []
    @State private var showPicker = false
    @State private var preprocessedImage: UIImage?
    @State private var gptResult: String?
    @State private var apiUsage: String?

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                if let image = preprocessedImage {
                    Text("Preprocessed Image for OCR")
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 300)
                }

                Button(action: {
                    showPicker = true
                }) {
                    Text("📸 사진에서 텍스트 추출 및 분류")
                        .foregroundColor(.blue)
                        .font(.headline)
                }

                if let result = gptResult {
                    Text("🗂️ GPT 분류 결과: \(result)")
                        .padding()
                        .background(Color.yellow.opacity(0.2))
                        .cornerRadius(10)

                    // [1.1], [1.2] → 식당 / 카페
                    if result.hasPrefix("[1.1]") || result.hasPrefix("[1.2]") {
                        DetailItem(title: "1. 식당 이름", content: extractDetail(from: recognizedText, key: "식당 이름"))
                        DetailItem(title: "2. 지역", content: extractDetail(from: recognizedText, key: "지역"))
                        DetailItem(title: "3. 주소", content: extractDetail(from: recognizedText, key: "주소"))
                        DetailItem(title: "4. 위치", content: extractDetail(from: recognizedText, key: "위치"))
                        DetailItem(title: "5. 메뉴", content: extractDetail(from: recognizedText, key: "메뉴"))
                    }
                    // [3.3] → 음식 (제품 설명 등)
                    else if result.hasPrefix("[3.3]") {
                        DetailItem(title: "1. 제품 이름", content: extractDetail(from: recognizedText, key: "이름"))
                        DetailItem(title: "2. 판매자", content: extractDetail(from: recognizedText, key: "판매자"))
                        DetailItem(title: "3. 가격", content: extractDetail(from: recognizedText, key: "가격"))
                        DetailItem(title: "4. 원산지", content: extractDetail(from: recognizedText, key: "원산지"))
                        DetailItem(title: "5. 중량", content: extractDetail(from: recognizedText, key: "중량"))
                        DetailItem(title: "6. 인증", content: extractDetail(from: recognizedText, key: "인증"))
                        DetailItem(title: "7. 만족도", content: extractDetail(from: recognizedText, key: "만족"))
                        DetailItem(title: "8. 옵션", content: extractDetail(from: recognizedText, key: "옵션"))
                    }
                    // 기타 → OCR 텍스트 그대로 출력
                    else {
                        let merged = mergeNumberedLines(from: recognizedText)
                        ForEach(Array(merged.enumerated()), id: \.offset) { _, line in
                            Text(line)
                                .modifier(DetailItemStyle())
                        }
                    }
                } else {
                    // GPT 결과가 없으면 OCR 텍스트만 보여줌
                    let merged = mergeNumberedLines(from: recognizedText)
                    ForEach(Array(merged.enumerated()), id: \.offset) { _, line in
                        Text(line)
                            .modifier(DetailItemStyle())
                    }
                }

                if let usage = apiUsage {
                    Text("🧾 API 사용량: \(usage)")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding()
        }
        .sheet(isPresented: $showPicker) {
            PhotoPicker(
                selectedImage: $selectedImage,
                recognizedText: $recognizedText,
                preprocessedImage: $preprocessedImage,
                gptResult: $gptResult,
                apiUsage: $apiUsage
            )
        }
    }

    func mergeNumberedLines(from lines: [String]) -> [String] {
        var result: [String] = []
        var i = 0
        let pattern = "^\\d+[\\.\\)]?$"

        while i < lines.count {
            let trimmed = lines[i].trimmingCharacters(in: .whitespaces)
            if let _ = trimmed.range(of: pattern, options: .regularExpression), i + 1 < lines.count {
                result.append("\(trimmed) \(lines[i + 1])")
                i += 2
            } else {
                result.append(lines[i])
                i += 1
            }
        }
        return result
    }

    // 텍스트에서 키워드가 포함된 첫 문장을 반환
    func extractDetail(from lines: [String], key: String) -> String {
        for line in lines {
            if line.contains(key) {
                return line
            }
        }
        return ""
    }
}

// 공통 출력 스타일 적용용
struct DetailItem: View {
    let title: String
    let content: String

    var body: some View {
        Text("\(title) \(content)")
            .modifier(DetailItemStyle())
    }
}

struct DetailItemStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}
