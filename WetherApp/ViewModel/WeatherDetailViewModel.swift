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
    var weatherDescriptiveText: String {
        weather?.weather.first?.description.lowercased() ?? "-"
    }
    
    var temperature: String {
        weather?.main.temp.temperatureRepresentation() ?? "-"
    }
    
    var humidity: String? {
        weather?.main.humidity.formatted()
    }
    
    var icon: Image? {
        defer { isLoading = false }
        guard let weather = weather else { return nil }
        isLoading = true
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

extension Double {
    func temperatureRepresentation(unit: UnitTemperature = .celsius) -> String {
        let temperature = Measurement(value: self.rounded(), unit: unit)
        let formatter = MeasurementFormatter()
//        formatter.numberFormatter.maximumFractionDigits = 1
        formatter.unitOptions = .providedUnit
        return formatter.string(from: temperature)
    }
}
