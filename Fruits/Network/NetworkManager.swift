//
//  NetworkManager.swift
//  Fruits
//
//  Created by Ewan Chelley on 13/07/2024.
//

import Foundation

protocol NetworkManaging {
    func fetchAndDecodeJSON<T: Decodable>(url: URL) async throws -> T
}

class NetworkManager: NetworkManaging {
    
    private let usageStats: UsageStats.Type
    
    init(usageStats: UsageStats.Type = UsageStatsManager.self) {
        self.usageStats = usageStats
    }
    
    func fetchAndDecodeJSON<T: Decodable>(url: URL) async throws -> T {
        let data = try await getRequest(url: url)
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
    }
    
    private func getRequest(url: URL) async throws -> Data {
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        
        let start = DispatchTime.now()
        let (data, response) = try await session.data(for: request)
        let end = DispatchTime.now()
        
        // Send usage statistics asynchronously
        Task {
            let elapsedTime = elapsedTimeMilliseconds(start, end)
            await usageStats.sendUsageStats(event: .load, data: elapsedTime)
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.statusCodeError(httpResponse.statusCode)
        }
        
        return data
    }
}
