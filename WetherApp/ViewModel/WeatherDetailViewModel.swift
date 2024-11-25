//
//  WeatherDetailViewModel.swift
//  WetherApp
//
//  Created by Lorenzo Decaria on 11/23/24.
//

import Foundation
import CoreLocation
import SwiftUI

@Observable
class WeatherDetailViewModel {
    var weather: WeatherResponse?
    var isLoading: Bool = false
    var errorMessage: String?
    
    let weatherService: WeatherFetchable
    
    init(weatherService: WeatherFetchable = WeatherClient()) {
        self.weatherService = weatherService
    }
    
    func fetchWeather(for location: CLLocation) {
        isLoading = true
        errorMessage = nil
        Task {
            do {
                weather = try await weatherService.fetchWeather(for: location)
            } catch {
                errorMessage = "Error fetching weather"
                print("Error fetching weather: \(error)")
            }
            isLoading = false
        }
    }
}

extension WeatherDetailViewModel {
    var weatherDescriptiveText: String? {
        weather?.weather.first?.description.capitalized
    }
    
    var temperature: String? {
        weather?.main.temp.formatted()
    }
    
    var humidity: String? {
        weather?.main.humidity.formatted()
    }
    
    var icon: Image? {
        guard let weather = weather else { return nil }
        Task {
            return try await Image(data: weatherService.fetchIcon(for: weather))
        }
        
        return nil
    }
}

extension Image {
    init?(data: Data) {
        guard let image = UIImage(data: data) else { return nil }
        self = .init(uiImage: image)
    }
    
}
