//
//  WeatherClient.swift
//  WetherApp
//
//  Created by Lorenzo Decaria on 11/23/24.
//

import Foundation
import CoreLocation

protocol WeatherFetchable {
    func fetchWeather(for location: CLLocation) async throws -> WeatherResponse
    func fetchIcon(for weather: WeatherResponse) async throws -> Data
}

final class WeatherClient: WeatherFetchable {
    private let session: URLSession
    
    enum WeatherClientError: Error {
        case invalidURL
        case invalidResponse
        case parsingError
    }
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchWeather(for location: CLLocation) async throws -> WeatherResponse {
        guard let url = buildURL(for: location) else { throw WeatherClientError.invalidURL }
        
        let (data, _) = try await session.data(from: url)
        let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weatherResponse
    }
    
    func fetchIcon(for weather: WeatherResponse) async throws -> Data {
        guard let url = buildIconURL(for: weather) else { throw WeatherClientError.invalidURL }
        let (data, _) = try await session.data(from: url)
        return data
    }
}

private extension WeatherClient {
    func buildURL(for location: CLLocation) -> URL? {
        var urlComponents = URLComponents(string: "https://api.openweathermap.org/data/2.5/weather")!
        urlComponents.queryItems = [
            URLQueryItem(name: "lat", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "lon", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "appid", value: "fadc3d8a7183214e18cd3caa79ae25c6")
        ]
        return urlComponents.url
    }
    
    func buildIconURL(for weather: WeatherResponse) -> URL? {
        let urlComponents = URLComponents(string: "https://openweathermap.org/img/wn/\(weather.weather.first?.icon ?? "")@2x.png")!
        return urlComponents.url
    }
}
