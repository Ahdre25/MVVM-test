//
//  BaseFlowModel.swift
//  MVVM test
//
//  Created by Fox on 12.09.2025.
//
import SwiftUI

@MainActor class BaseFlowModel: ObservableObject {
    @Published var path = NavigationPath()
    @Published var sheet: SheetRoute?
        @Published var cover: CoverRoute?

    func pop() { path.removeLast() }
    func popToRoot() { path.removeLast(path.count) }
    
    func presentSheet(_ s: SheetRoute) { sheet = s }
        func dismissSheet() { sheet = nil }

        func presentCover(_ c: CoverRoute) { cover = c }
        func dismissCover() { cover = nil }
    
    
}
