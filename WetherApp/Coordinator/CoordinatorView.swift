//
//  File.swift
//  WetherApp
//
//  Created by Lorenzo Decaria on 11/30/24.
//

import Foundation
import SwiftUI

struct CoordinatorView<P: Hashable, C: CoordinatorProtocol>: View where C.Page == P {
    @ObservedObject var coordinator: C
    var root: P
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.makeView(for: root)
                .navigationDestination(for: P.self) { page in
                    coordinator.makeView(for: page)
                }
        }
    }
}
