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
        VStack {
            Image(systemName: "sun.min.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundStyle(Color.yellow)
            Text(viewModel.temperature)
                .font(.system(size: 80))
                .bold()
            Text(viewModel.weatherDescriptiveText)
                .foregroundStyle(.gray)
        }
        .onAppear {
            Task {
                viewModel.fetchWeather(for: CLLocation(latitude: 51.5073219, longitude: -0.1276474))
            }
        }
    }
}

private extension WeatherDetailView {
    
}

#Preview {
    WeatherDetailView()
}
