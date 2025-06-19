import Foundation

func classifyTextWithGPT(prompt: String, apiKey: String, completion: @escaping (String, String) -> Void) {
    let url = URL(string: "https://api.openai.com/v1/chat/completions")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    let body: [String: Any] = [
        "model": "gpt-4",
        "messages": [
            ["role": "system", "content": "너는 분류 기준에 따라 스크린샷 텍스트를 정확히 분류하는 전문가야."],
            ["role": "user", "content": prompt]
        ],
        "temperature": 0.2
    ]

    request.httpBody = try? JSONSerialization.data(withJSONObject: body)

    URLSession.shared.dataTask(with: request) { data, _, _ in
        guard let data = data,
              let result = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
              let choice = (result["choices"] as? [[String: Any]])?.first,
              let message = choice["message"] as? [String: Any],
              let content = message["content"] as? String else {
            completion("❌ GPT 분류 실패", "")
            return
        }

        let usageDict = result["usage"] as? [String: Any]
        let totalTokens = usageDict?["total_tokens"] as? Int ?? 0

        completion(content.trimmingCharacters(in: .whitespacesAndNewlines), "\(totalTokens) tokens")
    }.resume()
}
