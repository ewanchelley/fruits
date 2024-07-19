//
//  UsageStats.swift
//  Fruits
//
//  Created by Ewan Chelley on 15/07/2024.
//

import Foundation

enum UsageStatsEvent: String {
    case load = "load"
    case display = "display"
    case error = "error"
}

protocol UsageStats {
    static func sendUsageStats(event: UsageStatsEvent, data: String) async
}

/// Makes sense to make UsageStatsManager static since it doesn't require
/// any instance specific behaviour.
class UsageStatsManager: UsageStats {
    static let endpoint = "/stats"
    
    static func sendUsageStats(event: UsageStatsEvent, data: String) async {
        let url = StatsURLBuilder.buildUrl(event: event, data: data)
        do {
            let session = URLSession.shared
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            let (_, response) = try await session.data(for: request)
            print("Usage stats sent: \(url)")
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.statusCodeError(httpResponse.statusCode)
            }
            
        } catch {
            // Don't send this usage stats for this error or could enter an infinite loop
            print("Failed to send usage statistics: \(error.localizedDescription)")
        }
    }
    
}

struct StatsURLBuilder {
    static func buildUrl(event: UsageStatsEvent, data: String) -> URL {
        var urlComponents = URLComponents(string: Constants.fruitsURL + UsageStatsManager.endpoint)!
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "event", value: event.rawValue),
            URLQueryItem(name: "data", value: data),
        ]
        urlComponents.queryItems = queryItems
        return urlComponents.url!
    }
}

func elapsedTimeMilliseconds(_ start: DispatchTime, _ end: DispatchTime) -> String {
    let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
    return String(nanoTime / 1_000_000)
}
