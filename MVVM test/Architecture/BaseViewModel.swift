//
//  BaseViewModel.swift
//  MVVM test
//
//  Created by Fox on 10.09.2025.
//
import Foundation
import SwiftUI
import Combine

@MainActor
class BaseViewModel: ObservableObject {
    
    var flowProvider: BaseFlowModel? {
        didSet {
            bindFlow()
        }
    }
    
    @Published var path = NavigationPath()
    @Published var sheet: SheetRoute?
    @Published var cover: CoverRoute?
    
    init(flowProvider: BaseFlowModel? = nil) {
        self.flowProvider = flowProvider
        bindFlow()
    }
    
    private func bindFlow() {
        cancellables.removeAll()
        guard let flow = flowProvider else { return }
        flow.$path
            .receive(on: DispatchQueue.main)
            .assign(to: &$path)
        
        flow.$sheet
            .receive(on: DispatchQueue.main)
            .assign(to: &$sheet)
        
        flow.$cover
            .receive(on: DispatchQueue.main)
            .assign(to: &$cover)
    }
    
    
    var cancellables: Set<AnyCancellable> = []
    
}

