//
//  WeatherDetailView.swift
//  WetherApp
//
//  Created by Lorenzo Decaria on 11/23/24.
//

import SwiftUI
import CoreLocation

struct WeatherDetailView: View {
    let viewModel = WeatherDetailViewModel()
    
    var body: some View {
        Text(viewModel.weatherDescriptiveText ?? "")
            .onAppear {
                Task {
                    viewModel.fetchWeather(for: CLLocation(latitude: 51.5073219, longitude: -0.1276474))
                }
            }
    }
}

#Preview {
    WeatherDetailView()
}
