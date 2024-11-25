//
//  OverviewSectionView.swift
//  WetherApp
//
//  Created by Lorenzo Decaria on 11/24/24.
//

import SwiftUI

struct OverviewSectionView: View {
    var body: some View {
        VStack {
            cityView
            temperatureView
        }
        .padding(.horizontal, 40)
    }
}

private extension OverviewSectionView {
    var cityView: some View {
        HStack {
            Text("Prague")
                .font(.headline)
            Spacer()
        }
    }
    
    var temperatureView: some View {
        HStack(alignment: .top) {
            Text("17°C")
                .font(.system(size: 80))
                .bold()
            Image(systemName: "star.fill")
                .padding(.top, 15)
            Spacer()
            VStack(alignment: .trailing) {
                Text("Sunny")
                    .font(.caption)
                    .padding(.top, 20)
                Spacer()
                Text("Feels like 16°C")
                    .font(.caption)
            }
        }
        .frame(height: 80)
    }
}


#Preview {
    OverviewSectionView()
}
