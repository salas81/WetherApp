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
    associatedtype Page: Hashable
//    associatedtype Sheet: Hashable, Identifiable
//    associatedtype FullScreenCover: Hashable, Identifiable

    var path: [Page] { get set }
//    var sheet: Sheet? { get set }
//    var fullScreenCover: FullScreenCover? { get set }
    @ViewBuilder func makeView(for scene: Page) -> Content
    func navigateTo(scene: Page)
}
