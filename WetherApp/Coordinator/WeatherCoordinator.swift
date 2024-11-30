//
//  WeatherCoordinator.swift
//  WetherApp
//
//  Created by Lorenzo Decaria on 11/30/24.
//

import Foundation
import SwiftUI

enum WeatherPage {
    case home
    case details
}

class WeatherCoordinator: CoordinatorProtocol, ObservableObject {
    @Published var path: [WeatherPage] = []
    
    @ViewBuilder
    func makeView(for page: WeatherPage) -> some View {
        buildView(for: page)
    }
    
    func navigateTo(scene: WeatherPage) {
        
    }
}

private extension WeatherCoordinator {
    @ViewBuilder
    func buildView(for page: WeatherPage) -> some View {
        EmptyView()
    }
}
