//
//  Coordinator.swift
//  WetherApp
//
//  Created by Lorenzo Decaria on 11/25/24.
//

import Foundation
import SwiftUI

protocol CoordinatorProtocol: ObservableObject {
    associatedtype Content: View
    associatedtype Scene: Hashable, Identifiable
//    associatedtype Sheet: Hashable, Identifiable
//    associatedtype FullScreenCover: Hashable, Identifiable

    var path: [Scene] { get set }
//    var sheet: Sheet? { get set }
//    var fullScreenCover: FullScreenCover? { get set }
    @ViewBuilder func makeView(for scene: Scene) -> Content
    func navigateTo(scene: Scene)
}
